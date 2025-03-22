import 'package:injectable/injectable.dart';
import 'package:zippy/data/model/story_pages_model.dart' as model;

@lazySingleton
class StoryPagesLocalSource {
  model.StoryPage? _cachedStoryPage;

  Future<model.StoryPage?> getStoryPage(String id) async {
    return _cachedStoryPage?.id == id ? _cachedStoryPage : null;
  }

  Future<void> saveStoryPage(model.StoryPage storyPage) async {
    _cachedStoryPage = storyPage;
  }

  Future<void> clearCache() async {
  _cachedStoryPage = null;
  }
}