import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:zippy/core/cache/story_cache_key.dart';
import 'package:zippy/core/http/app/app_exception.dart';
import 'package:zippy/data/source/local/story_pages_local_source.dart';
import 'package:zippy/data/source/remote/story_pages_remote_source.dart';
import 'package:zippy/domain/entity/home_pages_entity.dart';
import 'package:zippy/domain/entity/story_page_entity.dart';
import 'package:zippy/domain/repository/story_repository.dart';

@LazySingleton(as: StoryRepository)
class StoryRepositoryImpl implements StoryRepository {
  final StoryPagesRemoteSource _remoteSource;
  final StoryPagesLocalSource _localSource;

  StoryRepositoryImpl(this._remoteSource, this._localSource);

  @override
  Future<Either<AppException, StoryPageEntity>> getStoryPage(String id) async {
    try {
      final cacheKey = StoryCacheKey(
        id: id,
      );

      // Check local cache first
      final cachedStory = await _localSource.getStoryPage(cacheKey);
      if (cachedStory != null && cachedStory.id == id) {
        return Right(StoryPageEntity(
          id: cachedStory.id,
          homePageId: cachedStory.homePageId,
          title: cachedStory.title,
          subtitle: cachedStory.subtitle,
          imageUrl: cachedStory.imageUrl,
          audioUrl: cachedStory.audioUrl,
          lyrics: cachedStory.lyrics,
          createdAt: cachedStory.createdAt,
          updatedAt: cachedStory.updatedAt,
          homePage: HomePageEntity(
            id: cachedStory.homePage.id,
            title: cachedStory.homePage.title,
            subtitle: cachedStory.homePage.subtitle,
            imageUrl: cachedStory.homePage.imageUrl,
            storyPageId: cachedStory.homePage.storyPageId,
            createdAt: cachedStory.homePage.createdAt,
            updatedAt: cachedStory.homePage.updatedAt,
          ),
        ));
      }

      // If not in cache, get from remote
      final result = await _remoteSource.getStoryPage(id);

      return result.when(success: (story) {
        _localSource.saveStoryPage(story, cacheKey);
        return Right(StoryPageEntity(
          id: story.id,
          homePageId: story.homePageId,
          title: story.title,
          subtitle: story.subtitle,
          imageUrl: story.imageUrl,
          audioUrl: story.audioUrl,
          lyrics: story.lyrics,
          createdAt: story.createdAt,
          updatedAt: story.updatedAt,
          homePage: HomePageEntity(
            id: story.homePage.id,
            title: story.homePage.title,
            subtitle: story.homePage.subtitle,
            imageUrl: story.homePage.imageUrl,
            storyPageId: story.homePage.storyPageId,
            createdAt: story.homePage.createdAt,
            updatedAt: story.homePage.updatedAt,
          ),
        ));
      }, failure: (error) {
        return Left(error);
      });
    } catch (e) {
      return Left(AppException.serverError(e.toString()));
    }
  }
}
