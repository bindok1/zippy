// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:zippy/core/http/http_provider.dart' as _i720;
import 'package:zippy/data/repository/home_page_repository_impl.dart' as _i519;
import 'package:zippy/data/repository/story_repository_impl.dart' as _i386;
import 'package:zippy/data/source/local/home_pages_local_source.dart' as _i522;
import 'package:zippy/data/source/local/story_pages_local_source.dart' as _i132;
import 'package:zippy/data/source/remote/home_pages_remote_source.dart'
    as _i225;
import 'package:zippy/data/source/remote/story_pages_remote_source.dart'
    as _i375;
import 'package:zippy/di/module/app_module.dart' as _i141;
import 'package:zippy/domain/repository/home_page_repository.dart' as _i1030;
import 'package:zippy/domain/repository/story_repository.dart' as _i32;
import 'package:zippy/domain/usecase/get_home_page_usecase.dart' as _i463;
import 'package:zippy/domain/usecase/get_story_page_usecase.dart' as _i398;
import 'package:zippy/features/home/blocs/home_pages_bloc.dart' as _i458;
import 'package:zippy/features/story/blocs/story_bloc.dart' as _i931;
import 'package:zippy/services/connection_service.dart' as _i249;
import 'package:zippy/services/lyrics_service.dart' as _i495;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i409.GlobalKey<_i409.ScaffoldMessengerState>>(
        () => appModule.scaffoldMessengerKey);
    gh.lazySingleton<_i720.HttpProvider>(() => appModule.httpProvider);
    gh.lazySingleton<_i132.StoryPagesLocalSource>(
        () => _i132.StoryPagesLocalSource());
    gh.lazySingleton<_i249.ConnectionService>(() => _i249.ConnectionService());
    gh.lazySingleton<_i225.HomePagesRemoteSource>(
        () => _i225.HomePagesRemoteSource(gh<_i720.HttpProvider>()));
    gh.lazySingleton<_i375.StoryPagesRemoteSource>(
        () => _i375.StoryPagesRemoteSource(gh<_i720.HttpProvider>()));
    gh.lazySingleton<_i522.HomePagesLocalSource>(
        () => _i522.HomePagesLocalSource(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i495.LyricsService>(
        () => _i495.LyricsService(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i1030.HomeRepository>(() => _i519.HomeRepositoryImpl(
          gh<_i225.HomePagesRemoteSource>(),
          gh<_i522.HomePagesLocalSource>(),
        ));
    gh.lazySingleton<_i32.StoryRepository>(() => _i386.StoryRepositoryImpl(
          gh<_i375.StoryPagesRemoteSource>(),
          gh<_i132.StoryPagesLocalSource>(),
        ));
    gh.lazySingleton<_i463.GetHomePagesUseCase>(
        () => _i463.GetHomePagesUseCase(gh<_i1030.HomeRepository>()));
    gh.lazySingleton<_i398.GetStoryPageUseCase>(
        () => _i398.GetStoryPageUseCase(gh<_i32.StoryRepository>()));
    gh.factory<_i458.HomePagesBloc>(
        () => _i458.HomePagesBloc(gh<_i463.GetHomePagesUseCase>()));
    gh.factory<_i931.StoryBloc>(
        () => _i931.StoryBloc(gh<_i398.GetStoryPageUseCase>()));
    return this;
  }
}

class _$AppModule extends _i141.AppModule {}
