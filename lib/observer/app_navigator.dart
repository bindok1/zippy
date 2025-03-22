import 'package:flutter/material.dart';

class AppNavigatorObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    _printCurrentRoute('didPop', previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    _printCurrentRoute('didPush', route);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    _printCurrentRoute('didRemove', previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _printCurrentRoute('didReplace', newRoute);
  }

  void _printCurrentRoute(String action, Route? route) {
    print('$action: Current route: ${route?.settings.name}');
  }
}
