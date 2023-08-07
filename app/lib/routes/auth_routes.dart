import 'package:areweeven/pages/login/login_page.dart';
import 'package:areweeven/pages/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const authRoutes = [
  TypedGoRoute<WelcomeRoute>(
    path: "welcome",
  ),
  TypedGoRoute<LoginRoute>(path: "login")
];

class WelcomeRoute extends GoRouteData {
  const WelcomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WelcomePage();
}

class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginPage();
}
