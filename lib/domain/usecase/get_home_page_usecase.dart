import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zippy/core/http/app/app_exception.dart';
import 'package:zippy/domain/entity/home_pages_entity.dart';
import 'package:zippy/domain/repository/home_page_repository.dart';


@lazySingleton
class GetHomePagesUseCase {
  final HomeRepository _repository;

  GetHomePagesUseCase(this._repository);

  Future<Either<AppException, List<HomePageEntity>>> execute() {
    return _repository.getHomePages();
  }
}