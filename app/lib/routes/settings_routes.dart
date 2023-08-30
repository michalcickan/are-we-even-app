import 'package:areweeven/pages/add_address/add_address.dart';
import 'package:areweeven/pages/address_list/address_list_page.dart';
import 'package:areweeven/pages/choose_option/choose_option_page.dart';
import 'package:areweeven/pages/choose_option/choose_option_providers.dart';
import 'package:areweeven/pages/registration/registration_page.dart';
import 'package:areweeven/pages/settings/settings_page.dart';
import 'package:areweeven/pages/settings/settings_providers.dart';
import 'package:areweeven/pages/update_profile/update_profile_page.dart';
import 'package:awe_widgets/awe_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes_global_keys.dart';

const shelledSettingsRoutes = [
  TypedGoRoute<ProfileRoute>(
    path: "profile",
  ),
  TypedGoRoute<AppearanceRoute>(
    path: "appearance",
  ),
  TypedGoRoute<UpdateProfileRoute>(
    path: "update-profile",
  ),
  TypedGoRoute<ChooseOptionRoute>(
    path: "choose-option",
  ),
  TypedGoRoute<AddressesRoute>(
    path: "addresses",
  ),
];

const settingsRoutes = [
  TypedGoRoute<AddAddressRoute>(
    path: "add-address",
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

class AddAddressRoute extends GoRouteData {
  const AddAddressRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return AWEDialogPage(builder: (_) => const AddAddressPage());
  }
}

class AddressesRoute extends GoRouteData {
  const AddressesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AddressListPage();
  }
}

class ChooseOptionRoute extends GoRouteData {
  final ChooseOptionType? type;

  const ChooseOptionRoute(this.type);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChooseOptionPage(
      type ?? ChooseOptionType.theme,
    );
  }
}
