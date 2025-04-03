import 'package:flutter/material.dart';
import 'package:zippy/common/menu_nav/menu_page.dart';
import 'package:zippy/features/auth/pages/login_page.dart';
import 'package:zippy/features/auth/pages/splash_page.dart';
import 'package:zippy/features/home/pages/home_page.dart';
import 'package:zippy/features/story/pages/story_page.dart';

class AppRoute {
  static const String menuPage = '/';
  static const String splashPage = 'splash_screen';
  static const String loginPage = 'login_page';
  static const String homePage = 'home_page';
  static const String runPodcastPage = 'run_podcast';
  static const String detailPodcastPage = 'detail_podcast';
  static const String storyPage = 'story_page';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashPage:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: settings,
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
          settings: settings,
        );
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );
      case menuPage:
        return MaterialPageRoute(
          builder: (_) => const MenuPage(),
          settings: settings,
        );
      case storyPage:
        final storyPageId = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => StoryPage(storyPageId: storyPageId),
            settings: settings);

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
