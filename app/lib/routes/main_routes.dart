import 'package:areweeven/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const mainRoutes = [
  TypedGoRoute<HomeRoute>(
    path: "home",
  ),
];

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}
