import 'package:flutter/material.dart';
import 'package:zippy/common/menu_nav/menu_page.dart';
import 'package:zippy/features/home/pages/home_page.dart';

class AppRoute {
  static const String menuPage = '/';
  static const String homePage = 'home_page';
  static const String runPodcastPage = 'run_podcast';
  static const String detailPodcastPage = 'detail_podcast';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
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
