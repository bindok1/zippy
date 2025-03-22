part of 'story_bloc.dart';

@freezed
class StoryState with _$StoryState {
  const factory StoryState.initial() = _Initial;
  const factory StoryState.loading() = _Loading;
  const factory StoryState.loaded(StoryPageEntity story) = _Loaded;
  const factory StoryState.error(String message) = _Error;
}