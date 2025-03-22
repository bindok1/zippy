import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zippy/core/http/app/app_exception.dart';


part 'generated/api_response.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success;
  const factory ApiResult.failure(AppException error) = Failure;
}