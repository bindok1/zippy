import 'package:injectable/injectable.dart';
import 'package:zippy/core/http/http_provider.dart';
import 'package:zippy/core/http/http_method.dart';
import 'package:zippy/core/http/response/api_response.dart';
import 'package:zippy/data/model/story_pages_model.dart' as model;
import 'package:zippy/data/model/story_pages_model.dart';

@lazySingleton
class StoryPagesRemoteSource {
  final HttpProvider _httpProvider;

  StoryPagesRemoteSource(this._httpProvider);

  Future<ApiResult<model.StoryPage>> getStoryPage(String id) async {
    final result = await _httpProvider.call<StoryPagesResponse>(
      path: '/api/story-pages/$id',
      method: HttpMethod.GET,
      parser: (json) => StoryPagesResponse.fromJson(json),
    );

    return result.when(
      success: (response) {
        return ApiResult.success(response.data);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }
}
