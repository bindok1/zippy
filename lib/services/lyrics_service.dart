// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:zippy/features/story/model/lyric_model.dart';

@lazySingleton
class LyricsService {
  static const String _cacheKeyPrefix = 'lyrics_cache_';
  final SharedPreferences _prefs;
  final Map<String, List<LyricLine>> _memoryCache = {};

  LyricsService(this._prefs);

  // Fetches lyrics from network or cache based on story ID
  Future<List<LyricLine>> fetchLyricsFromNetwork(
      String lyricsUrl, String storyPageId) async {
    final cachedLyrics = await _getCachedLyrics(storyPageId);
    if (cachedLyrics != null) {
      return cachedLyrics;
    }

    return _fetchAndCacheLyrics(lyricsUrl, storyPageId);
  }

  // Retrieves cached lyrics by story ID
  Future<List<LyricLine>?> _getCachedLyrics(String storyPageId) async {
    if (_memoryCache.containsKey(storyPageId)) {
      return _memoryCache[storyPageId];
    }

    return _getPersistedLyrics(storyPageId);
  }

  // Gets lyrics from persistent storage
  Future<List<LyricLine>?> _getPersistedLyrics(String storyPageId) async {
    final cachedLyrics = _prefs.getString(_getCacheKey(storyPageId));
    if (cachedLyrics == null) return null;

    try {
      final lyrics = _parseLyrics(cachedLyrics);
      _memoryCache[storyPageId] = lyrics;
      return lyrics;
    } catch (e) {
      return null;
    }
  }

  // Fetches lyrics from network and caches them
  Future<List<LyricLine>> _fetchAndCacheLyrics(
      String lyricsUrl, String storyPageId) async {
    final response = await http.get(Uri.parse(lyricsUrl));
    if (response.statusCode != 200) {
      throw Exception('Failed to load lyrics');
    }

    final decodedBytes = utf8.decode(response.bodyBytes);
    final responseData = json.decode(decodedBytes);
    final lyrics = _parseLyrics(json.encode(responseData));

    await _cacheLyrics(storyPageId, responseData);
    return lyrics;
  }

  // Caches lyrics in both memory and persistent storage
  Future<void> _cacheLyrics(
      String storyPageId, Map<String, dynamic> lyricsData) async {
    final lyrics = _parseLyrics(json.encode(lyricsData));
    _memoryCache[storyPageId] = lyrics;
    await _prefs.setString(_getCacheKey(storyPageId), json.encode(lyricsData));
  }

  Duration _calculateDuration(List<LyricLine> lyrics) {
    if (lyrics.isEmpty) return Duration.zero;
    return lyrics.last.time;
  }

  Future<Duration> getLyricsDuration(
      String lyricsUrl, String storyPageId) async {
    final lyrics = await fetchLyricsFromNetwork(lyricsUrl, storyPageId);
    return _calculateDuration(lyrics);
  }

  List<LyricLine> _parseLyrics(String jsonStr) {
    final data = json.decode(jsonStr);
    final lyrics = data['lyrics'] as List;
    final parsedLyrics = lyrics
        .map((lyric) => LyricLine.fromMap({
              'time': Duration(milliseconds: lyric['time']),
              'text': lyric['text'],
              'audioPath': lyric['audioPath'] ?? '',
            }))
        .toList();

    return parsedLyrics;
  }

  // Clears all lyrics cache
  Future<void> clearLyricsCache() async {
    _memoryCache.clear();
    final keys =
        _prefs.getKeys().where((key) => key.startsWith(_cacheKeyPrefix));
    for (final key in keys) {
      await _prefs.remove(key);
    }
  }

  /// Generates cache key for story ID
  String _getCacheKey(String storyPageId) => '${_cacheKeyPrefix}_$storyPageId';
}
