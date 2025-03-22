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
  String _getCacheKey(String homePageId) {
    return '$_cacheKeyPrefix$homePageId';
  }

  Future<List<LyricLine>> fetchLyrics(String lyricsUrl, String homePageId) async {
    try {
      final cacheKey = _getCacheKey(homePageId);


      // Check cache first
      final cachedLyrics = _prefs.getString(cacheKey);
      if (cachedLyrics != null) {
        return _parseLyrics(cachedLyrics);
      }

      // If not in cache, fetch from network
      final response = await http.get(Uri.parse(lyricsUrl));
      if (response.statusCode == 200) {

        // Save to cache
        await _prefs.setString(cacheKey, response.body);
        return _parseLyrics(response.body);
      }
      throw Exception('Failed to load lyrics');
    } catch (e) {
      throw Exception('Error fetching lyrics: $e');
    }
  }

  List<LyricLine> _parseLyrics(String jsonStr) {
    final Map<String, dynamic> data = json.decode(jsonStr);
    final List<dynamic> lyrics = data['lyrics'];
    return lyrics.map((lyric) => LyricLine.fromMap({
      'time': Duration(milliseconds: lyric['time']),
      'text': lyric['text'],
      'audioPath': lyric['audioPath'] ?? '',
    })).toList();
  }
}