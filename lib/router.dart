import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_bar_with_riverpod/views/details_view.dart';
import 'package:persistent_bottom_bar_with_riverpod/views/home_view.dart';
import 'package:persistent_bottom_bar_with_riverpod/views/root_view.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
const a = '/a';
const b = '/b';
const details = 'details';
// the one and only GoRouter instance
final goRouter = GoRouter(
  initialLocation: '/a',
  navigatorKey: _rootNavigatorKey,
  routes: [
    // Stateful nested navigation based on:
    // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return HomeShell(navigationShell: navigationShell);
      },
      branches: [
        // first branch (A)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: a,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: RootView(label: a, detailsPath: '$a/$details'),
              ),
              routes: [
                // child route
                GoRoute(
                  path: details,
                  builder: (context, state) => const DetailsView(label: a),
                ),
              ],
            ),
          ],
        ),
        // second branch (B)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: b,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: RootView(label: b, detailsPath: '$b/$details'),
              ),
              routes: [
                // child route
                GoRoute(
                  path: details,
                  builder: (context, state) => const DetailsView(label: b),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

// use like this:
// MaterialApp.router(routerConfig: goRouter, ...)
