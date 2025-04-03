import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:zippy/data/model/home_pages_model.dart';

@lazySingleton
class HomePagesLocalSource {
  final SharedPreferences _prefs;
  final String _cacheKey = 'home_pages_cache';
  
  HomePagesLocalSource(this._prefs);

  Future<List<Story>> getStories() async {
    final String? jsonData = _prefs.getString(_cacheKey);
    if (jsonData != null) {
      final List<dynamic> jsonList = jsonDecode(jsonData);
      return jsonList.map((json) => Story.fromJson(json)).toList();
    }
    return [];
  }

  Future<void> saveStories(List<Story> stories) async {
    final List<Map<String, dynamic>> jsonList = 
        stories.map((story) => story.toJson()).toList();
    final String jsonData = jsonEncode(jsonList);
    await _prefs.setString(_cacheKey, jsonData);
  }

  Future<void> clearCache() async {
    await _prefs.remove(_cacheKey);
  }
}