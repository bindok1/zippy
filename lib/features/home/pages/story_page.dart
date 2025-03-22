import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zippy/features/home/cubit/opacity_cubit.dart';
import 'package:zippy/features/home/models/lyric_model.dart';
import 'package:zippy/features/home/widgets/podcast_header.dart';
import 'package:zippy/features/home/widgets/lyrics_view.dart';
import 'package:zippy/source/data_dummy.dart';
import 'package:zippy/services/audio_service.dart';
import 'package:zippy/theme/app_asset.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final _audioService = AudioService();
  late ScrollController _scrollController;
  late OpacityCubit _opacityCubit;
  final double _expandedHeight = 460;
  final random = Random();
  bool isPlaying = false;
  int currentLyricIndex = 0;

  Future<void> _handlePlayButton() async {
    try {
      await (isPlaying
          ? _audioService.pauseAudio()
          : _audioService.playAudio(DataDummy.kancilPodcastData['audioPath']));
    } catch (e) {
      debugPrint('Error playing audio: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _opacityCubit = OpacityCubit();
    _scrollController = ScrollController();
    _audioService.addPlayingStateListener((playing) {
      setState(() {
        isPlaying = playing;
      });
    });

    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      double newOpacity =
          (offset / (_expandedHeight - kToolbarHeight)).clamp(0.0, 1.0);

      if (newOpacity >= 0.9) {
        _opacityCubit.updateOpacity(newOpacity);
      } else {
        _opacityCubit.updateOpacity(0.0);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _audioService.stopAudio();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lyrics = (DataDummy.kancilPodcastData['lyrics'] as List)
        .map((lyric) => LyricLine(
              time: lyric['time'] as Duration,
              text: lyric['text'] as String,
              audioPath: DataDummy.kancilPodcastData['audioPath'] as String,
            ))
        .toList();

    return BlocProvider(
      create: (context) => _opacityCubit,
      child: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              PodcastHeader(
                expandedHeight: _expandedHeight,
                image: AppAsset.banner1,
                isPlaying: isPlaying,
                onPlayPressed: _handlePlayButton,
                onBackPressed: () => Navigator.pop(context),
                title: 'Kancil dan Petani yang Marah',
                subtitle: 'Di sebuah ladang yang luas',
                duration: DataDummy.kancilPodcastData['duration'] as Duration,
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: LyricsView(
              lyrics: lyrics,
              audioService: _audioService,
            ),
          ),
        ),
      ),
    );
  }
}
