import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:zippy/core/cache/story_cache_key.dart';
import 'package:zippy/data/model/story_pages_model.dart' as model;

@lazySingleton
class StoryPagesLocalSource {
  final Map<String, model.StoryPage> _cachedStories = {};

  Future<model.StoryPage?> getStoryPage(StoryCacheKey cacheKey) async {
    final story = _cachedStories[cacheKey.id];
    if (_isCacheValid(story, cacheKey.id)) {
      return story;
    } else {
      _cachedStories.remove(cacheKey.id);
      return null;
    }
  }

  Future<void> saveStoryPage(
      model.StoryPage storyPage, StoryCacheKey cacheKey) async {
    debugPrint('Saving story to cache with ID: ${cacheKey.id}');
    _cachedStories[cacheKey.id] = storyPage;
  }

  Future<void> clearCache() async {
    _cachedStories.clear();
  }

  bool _isCacheValid(model.StoryPage? story, String requestId) {
    if (story == null) return false;
    return story.id == requestId;
  }
}
