import 'package:areweeven/pages/registration/registration_page.dart';
import 'package:areweeven/pages/settings/settings_page.dart';
import 'package:areweeven/pages/settings/settings_providers.dart';
import 'package:areweeven/pages/update_profile/update_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const settingsRoutes = [
  TypedGoRoute<ProfileRoute>(
    path: "profile",
  ),
  TypedGoRoute<AppearanceRoute>(
    path: "appearance",
  ),
  TypedGoRoute<UpdateProfileRoute>(
    path: "update-profile",
  ),
  TypedGoRoute<UpdateAddresses>(
    path: "update-addresses",
  ),
];

class ProfileRoute extends GoRouteData {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsPage(SettingsSection.profile);
}

class AppearanceRoute extends GoRouteData {
  const AppearanceRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const RegistrationPage();
}

class UpdateProfileRoute extends GoRouteData {
  const UpdateProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UpdateProfilePage();
  }
}

class UpdateAddresses extends GoRouteData {
  const UpdateAddresses();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UpdateProfilePage();
  }
}
