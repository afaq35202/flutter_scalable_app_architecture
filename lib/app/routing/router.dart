import 'package:dobby/app/routing/routes.dart';
import 'package:dobby/features/app_initializer/presentation/app_initializer_page.dart';
import 'package:dobby/features/home/presentation/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/machines/presentation/machines_page.dart';
import 'navigation_oberver.dart';

final router = GoRouter(
  initialLocation: Routes.appInitializer,
  debugLogDiagnostics: true,
  redirect: _redirect,
  observers: [LoggingObserver()],
  routes: [
    GoRoute(
      path: Routes.appInitializer,
      builder: (context, state) => const AppInitializerPage(),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: Routes.machinesListingRelative,
          builder: (context, state) => const MachinesPage(),
        ),
      ],
    ),
  ],
);

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  // if the user is not logged in, they need to login
  // final loggedIn = await context.read<AuthRepository>().isAuthenticated;
  // final loggingIn = state.matchedLocation == Routes.login;
  // if (!loggedIn) {
  //   return Routes.login;
  // }
  //
  // // if the user is logged in but still on the login page, send them to
  // // the home page
  // if (loggingIn) {
  //   return Routes.home;
  // }

  // no need to redirect at all
  return null;
}
