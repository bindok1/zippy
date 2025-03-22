import 'package:dartz/dartz.dart';
import 'package:zippy/core/http/app/app_exception.dart';
import 'package:zippy/domain/entity/home_pages_entity.dart';

abstract class HomeRepository {
  Future<Either<AppException, List<HomePageEntity>>> getHomePages();
}