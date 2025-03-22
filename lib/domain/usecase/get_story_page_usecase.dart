import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zippy/core/http/app/app_exception.dart';
import 'package:zippy/domain/entity/story_page_entity.dart';
import 'package:zippy/domain/repository/story_repository.dart';

@lazySingleton
class GetStoryPageUseCase {
  final StoryRepository _repository;

  GetStoryPageUseCase(this._repository);

  Future<Either<AppException, StoryPageEntity>> execute(String id) {
    return _repository.getStoryPage(id);
  }
}