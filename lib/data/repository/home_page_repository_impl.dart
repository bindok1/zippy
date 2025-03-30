import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:zippy/core/http/app/app_exception.dart';
import 'package:zippy/data/source/local/home_pages_local_source.dart';
import 'package:zippy/data/source/remote/home_pages_remote_source.dart';
import 'package:zippy/domain/entity/home_pages_entity.dart';
import 'package:zippy/domain/repository/home_page_repository.dart';


@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomePagesRemoteSource _remoteSource;
  final HomePagesLocalSource _localSource;

  HomeRepositoryImpl(this._remoteSource, this._localSource);

  @override
  Future<Either<AppException, List<HomePageEntity>>> getHomePages() async {
    try {
      // Check local cache first
      final cachedStories = await _localSource.getStories();
      if (cachedStories.isNotEmpty) {
        final entities = cachedStories.map((story) => HomePageEntity(
          id: story.id,
          title: story.title,
          subtitle: story.subtitle,
          imageUrl: story.imageUrl,
          storyPageId: story.storyPageId,
          createdAt: story.createdAt,
          updatedAt: story.updatedAt,
        )).toList();
        return Right(entities);
      }

      // If not in cache, get from remote
      final result = await _remoteSource.getStories();
      
      return result.when(
        success: (stories) {
          _localSource.saveStories(stories);
          final entities = stories.map((story) => HomePageEntity(
            id: story.id,
            title: story.title,
            subtitle: story.subtitle,
            imageUrl: story.imageUrl,
            storyPageId: story.storyPageId,
            createdAt: story.createdAt,
            updatedAt: story.updatedAt,
          )).toList();
          return Right(entities);
        },
        failure: (error) => Left(error),
      );
    } catch (e) {
      return Left(AppException.serverError(e.toString()));
    }
  }
}