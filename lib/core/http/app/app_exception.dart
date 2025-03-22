import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/app_exception.freezed.dart';

@freezed
class AppException with _$AppException {
  const factory AppException.networkError([String? message]) = NetworkError;
  const factory AppException.serverError([String? message]) = ServerError;
  const factory AppException.unauthorized([String? message]) = Unauthorized;
  const factory AppException.notFound([String? message]) = NotFound;
  const factory AppException.invalidData([String? message]) = InvalidData;
  const factory AppException.timeOut([String? message]) = TimeOut;
  const factory AppException.noInternet([String? message]) = NoInternet;
}