import 'package:flutter/material.dart';

import 'package:zippy/services/audio_service.dart';
import 'package:zippy/theme/app_theme.dart';
import 'package:zippy/features/home/models/lyric_model.dart';

class LyricsView extends StatefulWidget {
  final List<LyricLine> lyrics;
  final AudioService audioService;

  const LyricsView({
    super.key,
    required this.lyrics,
    required this.audioService,
  });

  @override
  State<LyricsView> createState() => _LyricsViewState();
}

class _LyricsViewState extends State<LyricsView> {
  final ScrollController _lyricsController = ScrollController();
  final List<GlobalKey> _lyricKeys = [];
  int currentLyricIndex = 0;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    widget.audioService.addPlayingStateListener(_handlePlayingState);
    widget.audioService.addPositionListener(_updateLyricPosition);
    _lyricKeys.addAll(
      List.generate(widget.lyrics.length, (index) => GlobalKey()),
    );
  }

  void _updateLyricPosition(Duration position) {
    final int newIndex =
        widget.lyrics.indexWhere((line) => line.time > position) - 1;

    if (newIndex != currentLyricIndex && newIndex >= 0) {
      setState(() {
        currentLyricIndex = newIndex;
      });

      _scrollToCurrentLyric(newIndex);
    }
  }

  void _scrollToCurrentLyric(int index) {
    if (!_lyricsController.hasClients ||
        _lyricKeys[index].currentContext == null) {
      return;
    }

    final RenderBox renderBox =
        _lyricKeys[index].currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final availableHeight = context.findRenderObject()?.paintBounds.height ?? 0;
    final topPadding = availableHeight * 0.15;

    _lyricsController.animateTo(
      _lyricsController.offset + (position.dy - topPadding) * 0.2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _handlePlayingState(bool playing) {
    setState(() {
      isPlaying = playing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableHeight = constraints.maxHeight;
        return Stack(children: [
          ListView.builder(
            controller: _lyricsController,
            itemCount: widget.lyrics.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return SizedBox(height: availableHeight * 0.2);
              }
              if (index == widget.lyrics.length + 1) {
                return SizedBox(height: availableHeight * 0.7);
              }

              final lyricIndex = index - 1;
              final lyric = widget.lyrics[lyricIndex];

              return AnimatedDefaultTextStyle(
                key: _lyricKeys[lyricIndex],
                duration: const Duration(milliseconds: 300),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: currentLyricIndex == lyricIndex
                        ? AppTheme.primaryColor
                        : Colors.black54.withOpacity(0.2),
                    fontSize: currentLyricIndex == lyricIndex ? 20 : 18,
                    fontWeight: currentLyricIndex == lyricIndex
                        ? FontWeight.w900
                        : FontWeight.normal,
                    height: 1.5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    lyric.text,
                    textAlign: TextAlign.start,
                  ),
                ),
              );
            },
          ),
        ]);
      },
    );
  }

  @override
  void dispose() {
    widget.audioService.removePlayingStateListener(_handlePlayingState);
    widget.audioService.removePositionListener(_updateLyricPosition);
    _lyricsController.dispose();

    super.dispose();
  }
}
