import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_file_store/dio_cache_interceptor_file_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zippy/constant/api_const.dart';
import 'package:zippy/core/http/app/app_exception.dart';
import 'package:zippy/core/http/error_handler.dart';
import 'package:zippy/core/http/http_method.dart';
import 'package:zippy/core/http/response/api_response.dart';

class HttpProvider {
  late final CacheOptions cacheOptions;
  final Dio _dio;

  Future<void> _initCache() async {
    final dir = await getApplicationDocumentsDirectory();
    final cacheDir = '${dir.path}/cache';

    cacheOptions = CacheOptions(
      store: FileCacheStore(cacheDir),
      maxStale: const Duration(days: 7),
      policy: CachePolicy.request,
    );
  }

  HttpProvider() : _dio = Dio() {
    _dio.options = BaseOptions(
      baseUrl: ApiConst.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {'Content-Type': 'application/json'},
    );
    _initCache().then((_) {
      _dio.interceptors.add(
        DioCacheInterceptor(options: cacheOptions),
      );
    });
  }

  Future<ApiResult<T>> call<T>({
    required String path,
    required HttpMethod method,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    T Function(Map<String, dynamic>)? parser,
  }) async {
    try {
      final response = await _sendRequest(
        path: path,
        method: method,
        queryParameters: queryParameters,
        body: body,
      );

      if (parser != null) {
        final parsedData = parser(response.data);
        return ErrorHandler.handle(response.statusCode ?? 500, parsedData);
      }

      return ErrorHandler.handle(
          response.statusCode ?? 500, response.data as T);
    } on DioException catch (e) {
      return ApiResult.failure(
        AppException.networkError(e.message),
      );
    }
  }

  Future<Response> _sendRequest({
    required String path,
    required HttpMethod method,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    switch (method) {
      case HttpMethod.GET:
        return _dio.get(path, queryParameters: queryParameters);
      case HttpMethod.POST:
        return _dio.post(path, data: body, queryParameters: queryParameters);
    }
  }
}
