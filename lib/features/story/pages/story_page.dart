import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:zippy/di/injection.dart';
import 'package:zippy/domain/entity/story_page_entity.dart';
import 'package:zippy/features/home/cubit/opacity_cubit.dart';
import 'package:zippy/features/story/blocs/story_bloc.dart';
import 'package:zippy/features/story/model/lyric_model.dart';
import 'package:zippy/features/story/widget/custom_error_widget.dart';
import 'package:zippy/features/story/widget/podcast_header.dart';
import 'package:zippy/features/story/widget/lyrics_view.dart';
import 'package:zippy/services/lyrics_service.dart';
import 'package:zippy/services/audio_service.dart';
import 'package:zippy/theme/app_theme.dart';

class StoryPage extends StatefulWidget {
  final String storyPageId;
  const StoryPage({super.key, required this.storyPageId});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  static const double _expandedHeight = 460.0;
  static const double _opacityThreshold = 0.9;

  final _audioService = AudioService();
  final _lyricsService = getIt<LyricsService>();
  late final ScrollController _scrollController;
  late final OpacityCubit _opacityCubit;
  late StoryPageEntity? _currentStory;
  bool _isLoading = false;
  Duration? _duration;

  List<LyricLine>? _lyrics;
  bool _isPlaying = false;

  Future<void> _handlePlayButton() async {
    try {
      if (_currentStory == null) return;
      setState(() => _isLoading = true);
      if (_isPlaying) {
        HapticFeedback.lightImpact();
        await _audioService.pauseAudio();
      } else {
        await _audioService.playAudio(_currentStory!.audioUrl);
      }
      if (mounted) setState(() => _isLoading = false);
    } on Exception catch (e) {
      if (mounted) setState(() => _isLoading = false);
      _handleError('Audio playback error', e);
    }
  }

  Future<void> _loadLyrics(String lyricsUrl, String storyId) async {
    try {
      final lyrics =
          await _lyricsService.fetchLyricsFromNetwork(lyricsUrl, storyId);
      final duration =
          await _lyricsService.getLyricsDuration(lyricsUrl, storyId);
      if (mounted) {
        setState(() {
          _lyrics = lyrics;
          _duration = duration;
        });
      }
    } on Exception catch (e) {
      _handleError('Failed to load lyrics', e);
    }
  }

  void _handleError(String message, Exception error) {
    debugPrint('$message: $error');
    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }
  }

  void _handleScroll() {
    final offset = _scrollController.offset;
    final newOpacity =
        (offset / (_expandedHeight - kToolbarHeight)).clamp(0.0, 1.0);

    _opacityCubit
        .updateOpacity(newOpacity >= _opacityThreshold ? newOpacity : 0.0);
  }

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _setupListeners();
    _loadInitialStory();
  }

  void _initializeControllers() {
    _opacityCubit = OpacityCubit();
    _scrollController = ScrollController()..addListener(_handleScroll);
  }

  void _setupListeners() {
    _audioService.addPlayingStateListener(_onPlayingStateChanged);
  }

  void _onPlayingStateChanged(bool playing) {
    if (mounted) setState(() => _isPlaying = playing);
  }

  void _loadInitialStory() {
    context.read<StoryBloc>().add(StoryEvent.getStory(widget.storyPageId));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _audioService.removePlayingStateListener(_onPlayingStateChanged);
    _audioService.stopAudio();
    super.dispose();
  }

  Widget _buildLoadingIndicator() => Center(
        child: LoadingAnimationWidget.discreteCircle(
            color: AppTheme.primaryColor, size: 50),
      );

  Widget _buildErrorWidget(String message) => CustomErrorWidget(
        title: 'Connection Error 🛜',
        message: message,
        onRetry: () => Navigator.pop(context),
      );

  Widget _buildStoryContent(StoryPageEntity story) {
    _currentStory = story;
    if (_lyrics == null) {
      _loadLyrics(story.lyrics, story.id);
    }

    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (_, __) => [
        PodcastHeader(
          expandedHeight: _expandedHeight,
          image: story.imageUrl,
          isPlaying: _isPlaying,
          isLoading: _isLoading,
          onPlayPressed: _handlePlayButton,
          onBackPressed: () => Navigator.pop(context),
          title: story.title,
          subtitle: story.subtitle,
          duration: _duration ?? Duration.zero,
        ),
      ],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: _lyrics == null
            ? _buildLoadingIndicator()
            : LyricsView(
                lyrics: _lyrics!,
                audioService: _audioService,
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => _opacityCubit),
      ],
      child: Scaffold(
        body: BlocBuilder<StoryBloc, StoryState>(
          builder: (context, state) => state.when(
            initial: _buildLoadingIndicator,
            loading: _buildLoadingIndicator,
            error: _buildErrorWidget,
            loaded: _buildStoryContent,
          ),
        ),
      ),
    );
  }
}
