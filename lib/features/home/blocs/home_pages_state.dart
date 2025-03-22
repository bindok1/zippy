part of 'home_pages_bloc.dart';

@freezed
class HomePagesState with _$HomePagesState {
  const factory HomePagesState.initial() = _Initial;
  const factory HomePagesState.loading() = _Loading;
  const factory HomePagesState.loaded(List<HomePageEntity> stories) = _Loaded;
  const factory HomePagesState.error(String message) = _Error;
}