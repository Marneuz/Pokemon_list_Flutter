// ignore_for_file: constant_identifier_names

import 'package:go_router/go_router.dart';
import 'package:pokemon_list/pages/detail_page.dart';
import 'package:pokemon_list/pages/home_page.dart';

class NavigationRoutes {
  static const String HOME = '/';
  static const String DETAIL = '$HOME$_DETAIL_PATH';

  static const String _DETAIL_PATH = 'detail';
}

final router = GoRouter(routes: [
  GoRoute(
      path: NavigationRoutes.HOME,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
            path: NavigationRoutes._DETAIL_PATH,
            builder: (context, state) =>
                DetailPage(name: state.extra as String))
      ])
]);
