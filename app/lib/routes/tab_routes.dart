import 'package:areweeven/pages/app_scaffold.dart';
import 'package:areweeven/pages/groups/groups_page.dart';
import 'package:areweeven/pages/home/home_page.dart';
import 'package:areweeven/pages/settings/settings_page.dart';
import 'package:areweeven/pages/settings/settings_providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const tabRoutes = [
  TypedShellRoute<AppScaffoldRoute>(
    routes: [
      TypedGoRoute<HomeRoute>(
        path: "home",
      ),
      TypedGoRoute<SettingsRoute>(
        path: "settings",
      ),
      TypedGoRoute<GroupsRoute>(
        path: "groups",
      )
    ],
  ),
];

class AppScaffoldRoute extends ShellRouteData {
  const AppScaffoldRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) {
    return AppScaffold(
      child: navigator,
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

class GroupsRoute extends GoRouteData {
  const GroupsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const GroupsPage();
  }
}
