import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zippy/common/routers/app_router.dart';
import 'package:zippy/common/menu_nav/menu_cubit.dart';
import 'package:zippy/di/injection.dart';
import 'package:zippy/features/auth/cubit/auth_cubit.dart';
import 'package:zippy/features/home/blocs/home_pages_bloc.dart';
import 'package:zippy/features/home/cubit/opacity_cubit.dart';
import 'package:zippy/features/story/blocs/story_bloc.dart';
import 'package:zippy/observer/app_navigator.dart';
import 'package:zippy/theme/app_theme.dart';

class ZippyApp extends StatelessWidget {
  const ZippyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),  
        BlocProvider(create: (context)=> getIt<HomePagesBloc>()),
        BlocProvider(create: (context)=> getIt<StoryBloc>()),
        BlocProvider<MenuCubit>(
          create: (context) => MenuCubit(),
        ),
        BlocProvider<OpacityCubit>(
          create: (context) => OpacityCubit(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        initialRoute: AppRoute.splashPage,
        onGenerateRoute: AppRoute.generateRoute,
        navigatorObservers: [
          AppNavigatorObserver(),
        ],
      ),
    );
  }
}
