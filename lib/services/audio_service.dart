import 'package:flutter/services.dart';

class AudioService {
  static const platform = MethodChannel('com.niozihni.zippy/audio');
  bool isPlaying = false;
  final List<Function(bool)> _playingStateListeners = [];
  final List<Function(Duration)> _positionListeners = [];

  AudioService() {
    platform.setMethodCallHandler(_handleMethodCall);
  }

  Future<void> _handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'onPlayingStateChanged':
        isPlaying = call.arguments as bool;
        for (var listener in _playingStateListeners) {
          listener(isPlaying);
        }
        break;
      case 'onPositionChanged':
        final position = Duration(milliseconds: call.arguments as int);
        for (var listener in _positionListeners) {
          listener(position);
        }
        break;
    }
  }

  void addPlayingStateListener(Function(bool) listener) {
    _playingStateListeners.add(listener);
  }

  void removePlayingStateListener(Function(bool) listener) {
    _playingStateListeners.remove(listener);
  }

  void addPositionListener(Function(Duration) listener) {
    _positionListeners.add(listener);
  }

  void removePositionListener(Function(Duration) listener) {
    _positionListeners.remove(listener);
  }

  Future<void> playAudio(String path) async {
    await platform.invokeMethod('playAudio', {'path': path});
    isPlaying = true;
  }

  Future<void> pauseAudio() async {
    await platform.invokeMethod('pauseAudio');
    isPlaying = false;
  }

  Future<void> stopAudio() async {
    await platform.invokeMethod('stopAudio');
    isPlaying = false;
  }
}