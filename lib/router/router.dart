import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../home.dart';
import '../pages/page1.dart';

class AppRoute {
  late bool isFirstTime;
  late bool isLoggedIn;
  GoRouter? router;
  static final AppRoute _inst = AppRoute._internal();
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _sectionNavigatorKey = GlobalKey<NavigatorState>();
  static final _searchSectionNavigatorKey = GlobalKey<NavigatorState>();
  static final _historySectionNavigatorKey = GlobalKey<NavigatorState>();

  factory AppRoute(bool isFirstTime, bool isloggedIn) {
    _inst.isFirstTime = isFirstTime;
    _inst.isLoggedIn = isloggedIn;
    _inst.router ??= GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/',
      routes: [
        GoRoute(
          name: '/',
          path: '/',
          pageBuilder: (context, state) {
            return const MaterialPage(child: Home());
          },
          builder: (context, GoRouterState state) => const Home(),
        ),
        GoRoute(
          name: '/page1',
          path: '/page1',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: Page1(),
            );
          },
          builder: (context, GoRouterState state) => const Page1(),
        ),
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: Scaffold());
      },
    );
    return _inst;
  }
  AppRoute._internal();

  // static String getInitialLocation({required bool isFirstTime}) {
  //   if (!isFirstTime) {
  //     return AppRouteConstants.login;
  //   }
  //   return '/';
  // }
}
