import 'package:areweeven/pages/splash_page.dart';
import 'package:areweeven/routes/auth_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'main_routes.dart';

part 'routes.g.dart';

@TypedGoRoute<RootRoute>(
  path: "/",
  routes: <TypedGoRoute<GoRouteData>>[
    ...authRoutes,
    ...mainRoutes,
  ],
)
class RootRoute extends GoRouteData {
  const RootRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SplashPage();
}
