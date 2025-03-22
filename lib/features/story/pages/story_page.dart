import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zippy/di/injection.dart';
import 'package:zippy/features/home/cubit/opacity_cubit.dart';
import 'package:zippy/features/story/blocs/story_bloc.dart';
import 'package:zippy/features/story/model/lyric_model.dart';
import 'package:zippy/features/story/widget/podcast_header.dart';
import 'package:zippy/features/story/widget/lyrics_view.dart';
import 'package:zippy/services/lyrics_service.dart';
import 'package:zippy/source/data_dummy.dart';
import 'package:zippy/services/audio_service.dart';

class StoryPage extends StatefulWidget {
  final String storyId;
  const StoryPage({super.key, required this.storyId});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final _audioService = AudioService();
  final _lyricsService = getIt<LyricsService>();
  late ScrollController _scrollController;
  late OpacityCubit _opacityCubit;
  final double _expandedHeight = 460;
  List<LyricLine>? _lyrics;
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

  Future<void> _loadLyrics(String lyricsUrl, String homePageId) async {
    try {
      final lyrics = await _lyricsService.fetchLyrics(lyricsUrl, homePageId);
      setState(() {
        _lyrics = lyrics;
      });
    } catch (e) {
      debugPrint('Error loading lyrics: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _opacityCubit = OpacityCubit();
    _scrollController = ScrollController();
    context.read<StoryBloc>().add(StoryEvent.getStory(widget.storyId));
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _opacityCubit,
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<StoryBloc, StoryState>(
          builder: (context, state) {
            return state.when(
                initial: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                error: (message) => Center(
                      child: Text('error in story page $message'),
                    ),
                loading: () => const Center(
                      child: Text('Loading'),
                    ),
                loaded: (story) {
                  if (_lyrics == null) {
                    _loadLyrics(story.lyrics, story.id);
                  }

                  return NestedScrollView(
                    controller: _scrollController,
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return [
                        PodcastHeader(
                          expandedHeight: _expandedHeight,
                          image: story.imageUrl,
                          isPlaying: isPlaying,
                          onPlayPressed: _handlePlayButton,
                          onBackPressed: () => Navigator.pop(context),
                          title: story.title,
                          subtitle: story.subtitle,
                          duration: DataDummy.kancilPodcastData['duration']
                              as Duration,
                        ),
                      ];
                    },
                    body: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: _lyrics == null
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : LyricsView(
                              lyrics: _lyrics!,
                              audioService: _audioService,
                            ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
