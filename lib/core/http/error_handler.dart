import 'app/app_exception.dart';
import 'response/api_response.dart';

class ErrorHandler {
  static Future<ApiResult<T>> handle<T>(int statusCode, T? data) async {
    switch (statusCode) {
      case 200:
        return ApiResult.success(data as T);
      case 404:
        return const ApiResult.failure(
          AppException.notFound('Resource not found'),
        );
      case 500:
        return const ApiResult.failure(
          AppException.serverError('Internal server error'),
        );
      default:
        return ApiResult.failure(
          AppException.networkError('Error code: $statusCode'),
        );
    }
  }
}