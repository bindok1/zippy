import 'package:injectable/injectable.dart';
import 'package:zippy/core/http/http_provider.dart';
import 'package:zippy/core/http/http_method.dart';
import 'package:zippy/core/http/response/api_response.dart';
import 'package:zippy/data/model/home_pages_model.dart';

@lazySingleton
class HomePagesRemoteSource {
  final HttpProvider _httpProvider;

  HomePagesRemoteSource(this._httpProvider);

  Future<ApiResult<List<Story>>> getStories() async {
    final result = await _httpProvider.call<HomePagesResponse>(
      path: '/api/home-pages',
      method: HttpMethod.GET,
      parser: (json) => HomePagesResponse.fromJson(json),
    );

    return result.when(
      success: (response) => ApiResult.success(response.data),
      failure: (error) => ApiResult.failure(error),
    );
  }
}