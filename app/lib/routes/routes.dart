import 'package:areweeven/pages/home/home_page.dart';
import 'package:areweeven/routes/auth_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: "/",
  routes: <TypedGoRoute<GoRouteData>>[
    ...authRoutes,
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}
