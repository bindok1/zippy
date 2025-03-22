import 'package:dartz/dartz.dart';
import 'package:zippy/core/http/app/app_exception.dart';
import 'package:zippy/domain/entity/story_page_entity.dart';

abstract class StoryRepository {
  Future<Either<AppException, StoryPageEntity>> getStoryPage(String id);
}