import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:zippy/features/story/model/lyric_model.dart';

@lazySingleton
class LyricsService {
  final SharedPreferences _prefs;
  static const String _cacheKeyPrefix = 'lyrics_cache_';

  LyricsService(this._prefs);
  String _getCacheKey(String storyPageId) {
    final storyPrefix = storyPageId.substring(0, 5);
    return '${_cacheKeyPrefix}${storyPrefix}_$storyPageId';
  }

  Future<List<LyricLine>> fetchLyrics(
      String lyricsUrl, String storyPageId) async {
    try {
      final cacheKey = _getCacheKey(storyPageId);
      debugPrint('Cache Key: $cacheKey for Story ID: $storyPageId');

      // Check cache first
      final cachedLyrics = _prefs.getString(cacheKey);
      if (cachedLyrics != null) {
        debugPrint('Lyrics found in cache, using cache $cacheKey');
        return _parseLyrics(cachedLyrics);
      }

      // If not in cache, fetch from network
      final response = await http.get(Uri.parse(lyricsUrl));
      if (response.statusCode == 200) {
        debugPrint('Lyrics fetched from network');
        final decodedResponse = utf8.decode(response.bodyBytes);
        await _prefs.setString(cacheKey, decodedResponse);
        return _parseLyrics(decodedResponse);
      }
      throw Exception('Failed to load lyrics');
    } catch (e) {
      throw Exception('Error fetching lyrics: $e');
    }
  }

  List<LyricLine> _parseLyrics(String jsonStr) {
    final Map<String, dynamic> data = json.decode(jsonStr);
    final List<dynamic> lyrics = data['lyrics'];
    return lyrics
        .map((lyric) => LyricLine.fromMap({
              'time': Duration(milliseconds: lyric['time']),
              'text': lyric['text'],
              'audioPath': lyric['audioPath'] ?? '',
            }))
        .toList();
  }

  Future<void> clearLyricsCache() async {
    final keys = _prefs.getKeys();
    for (final key in keys) {
      if (key.startsWith(_cacheKeyPrefix)) {
        await _prefs.remove(key);
        debugPrint('Cleared lyrics cache: $key');
      }
    }
  }
}
