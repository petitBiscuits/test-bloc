import 'package:bloc_pattern_example/features/alarms/presentations/alarms_detail.dart';
import 'package:bloc_pattern_example/features/alarms/presentations/alarms_page.dart';
import 'package:bloc_pattern_example/features/children/bloc/children_bloc.dart';
import 'package:bloc_pattern_example/features/children/presentation/children_detail.dart';
import 'package:bloc_pattern_example/features/children/presentation/children_detail_edit.dart';
import 'package:bloc_pattern_example/features/children/presentation/children_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_provider/go_provider.dart';
import 'package:go_router/go_router.dart';

import '../core/widget/scaffol_with_nested_navigation.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');

// the one and only GoRouter instance
final goRouter = GoRouter(
  initialLocation: '/children',
  navigatorKey: _rootNavigatorKey,
  routes: [
    // Stateful nested navigation based on:
    // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return ScaffoldWithNestedNavigation(
            navigationShell: navigationShell);
      },
      branches: [
        // first branch (A)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            // top route inside branch
            GoProviderRoute(
              path: '/children',
              providers: [
                BlocProvider(create: (context) => ChildrenBloc()..add(ChildrenInitialEvent())),
              ],
              builder: (context, state) => ChildrenPage(),
              routes: [
                // child route
                GoRoute(
                  path: 'details',
                  builder: (context, state) =>
                  const ChildrenDetail(),
                  routes: [
                    GoRoute(path: 'edit-child', builder: (context, state) => const ChildrenDetailEdit())
                  ]
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
              path: '/alarms',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AlarmsPage(),
              ),
              routes: [
                // child route
                GoRoute(
                  path: 'details',
                  builder: (context, state) =>
                  const AlarmsDetail(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

class AllarmPage {
  const AllarmPage();
}