import 'package:areweeven/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const authRoutes = [
  TypedGoRoute<LoginRoute>(
    path: "login",
  ),
];

class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginPage();
}
