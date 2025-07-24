import 'package:dobby/app/routing/routes.dart';
import 'package:dobby/features/app_initializer/presentation/app_initializer_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


GoRouter router() => GoRouter(
  initialLocation: Routes.appInitializer,
  debugLogDiagnostics: true,
  redirect: _redirect,
  // refreshListenable: authRepository,
  routes: [
    // GoRoute(
    //   path: Routes.login,
    //   builder: (context, state) {
    //     return LoginScreen(
    //       viewModel: LoginViewModel(authRepository: context.read()),
    //     );
    //   },
    // ),
    GoRoute(
      path: Routes.appInitializer,
      builder: (context, state) => AppInitializerPage(),
      routes: [
        // GoRoute(
        //   path: Routes.searchRelative,
        //   builder: (context, state) {
        //     final viewModel = SearchFormViewModel(
        //       continentRepository: context.read(),
        //       itineraryConfigRepository: context.read(),
        //     );
        //     return SearchFormScreen(viewModel: viewModel);
        //   },
        // ),
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
