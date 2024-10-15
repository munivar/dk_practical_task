import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sgmasms/animations/fade_page.dart';
import 'package:sgmasms/core/device/utils.dart';
import 'package:sgmasms/locator.dart';
import 'package:sgmasms/demo/demo_cubit.dart';
import 'package:sgmasms/demo/demo_scn.dart';

class Routes {
  static const login = "/login";

  static final GoRouter router = GoRouter(
    initialLocation: login,
    debugLogDiagnostics: true,
    // observers: [GoRouterObserver()],
    routes: <RouteBase>[
      GoRoute(
        name: login,
        path: login,
        builder: (context, state) {
          return goToLogin(context, state);
        },
      ),
    ],
  );

  static Future<bool?> showBackDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text(
            'Are you sure you want to leave this page?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Nevermind'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Leave'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }
}

// class GoRouterObserver extends NavigatorObserver {
//   @override
//   void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     debugPrint('didPush: $route');
//   }

//   @override
//   void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     debugPrint('didPop: $route');
//   }

//   @override
//   void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     debugPrint('didRemove: $route');
//   }

//   @override
//   void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
//     debugPrint('didReplace: $newRoute');
//   }
// }

platformSpeRoute(BuildContext context, GoRouterState state, {Widget? child}) {
  if (Utils.isWeb) {
    return FadeTransitionPage<dynamic>(key: state.pageKey, child: child!);
  }
  return MaterialPage(child: child!);
}

goToLogin(BuildContext context, GoRouterState state) {
  if (!locator.isRegistered<DemoBloc>()) {
    // locator.registerFactory<LoginBloc>(() => LoginBloc(locator()));
    locator.registerFactory<DemoBloc>(() => DemoBloc());
  }
  return Builder(
    builder: (context) {
      return BlocProvider(
        create: (context) => locator<DemoBloc>(),
        child: const DemoScreen(),
      );
    },
  );
}
