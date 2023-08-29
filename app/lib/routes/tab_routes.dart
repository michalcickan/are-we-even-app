import 'package:areweeven/pages/app_scaffold.dart';
import 'package:areweeven/pages/group_list/group_list_page.dart';
import 'package:areweeven/pages/home/home_page.dart';
import 'package:areweeven/pages/settings/settings_page.dart';
import 'package:areweeven/pages/settings/settings_providers.dart';
import 'package:areweeven/routes/expense_routes.dart';
import 'package:areweeven/routes/group_routes.dart';
import 'package:areweeven/routes/settings_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes_global_keys.dart';

const tabRoutes = TypedStatefulShellRoute<AppScaffoldShellRoute>(
  branches: [
    TypedStatefulShellBranch(routes: [
      TypedGoRoute<HomeRoute>(
        path: "home",
        routes: shelledExpenseRoutes,
      ),
    ]),
    TypedStatefulShellBranch(routes: [
      TypedGoRoute<GroupListRoute>(
        path: "groups",
        routes: shelledGroupRoutes,
      ),
    ]),
    TypedStatefulShellBranch<SettingsBranch>(routes: [
      TypedGoRoute<SettingsRoute>(
        path: "settings",
        routes: shelledSettingsRoutes,
      ),
    ])
  ],
);

class AppScaffoldShellRoute extends StatefulShellRouteData {
  const AppScaffoldShellRoute();

  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state,
      StatefulNavigationShell navigationShell) {
    return AppScaffold(
      navigationShell: navigationShell,
    );
  }
}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomePage();
}

class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const SettingsPage(SettingsSection.main);
  }
}

class GroupListRoute extends GoRouteData {
  const GroupListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const GroupListPage();
  }
}

class SettingsBranch extends StatefulShellBranchData {
  const SettingsBranch();

  static final GlobalKey<NavigatorState> $navigatorKey = GlobalKey();
}
