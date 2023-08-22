import 'package:areweeven/gen/app_localizations.dart';
import 'package:areweeven/global_providers/auth_provider.dart';
import 'package:areweeven/global_providers/dialog_provider.dart';
import 'package:areweeven/global_providers/go_router_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/pages/choose_option/choose_option_providers.dart';
import 'package:areweeven/routes/routes.dart';
import 'package:areweeven/routes/settings_routes.dart';
import 'package:areweeven/utils/extensions/go_router_context.dart';
import 'package:areweeven/view_models/list_item_view_models.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_providers.g.dart';

enum SettingsSection {
  main,
  profile,
}

@riverpod
SettingsTexts settingsTexts(
  SettingsTextsRef ref,
  SettingsSection section,
) {
  return SettingsTexts(
    title: section.title(
      ref.watch(localizationProvider),
    ),
  );
}

@riverpod
class SettingsActions extends _$SettingsActions
    with ProviderRouterContextMixin {
  @override
  void build() {}

  void logout() {
    final localizations = ref.read(localizationProvider);
    ref.read(dialogProvider.notifier).state = DialogInfo(
      localizations.warning,
      text: localizations.logoutWarningText,
      actionItems: [
        DialogActionItem(
          localizations.logout,
          () {
            ref.read(authProvider.notifier).logout();
          },
        ),
      ],
    );
  }
}

@riverpod
List<ListItemViewModel> settingListItems(
  SettingListItemsRef ref,
  SettingsSection section,
) {
  VoidCallback onNavPressed(String location) =>
      () => ref.read(goRouterProvider).push(location);
  final localizations = ref.watch(localizationProvider);
  switch (section) {
    case SettingsSection.main:
      return _makeMainSectionItems(
        onNavPressed,
        localizations,
        ref.read(settingsActionsProvider.notifier),
      );
    case SettingsSection.profile:
      return _makeProfileSectionItems(
        onNavPressed,
        localizations,
      );
  }
}

class SettingsTexts {
  final String title;

  SettingsTexts({
    required this.title,
  });
}

extension _Data on SettingsSection {
  String title(AppLocalizations localizations) {
    switch (this) {
      case SettingsSection.main:
        return localizations.settingsTabTitle;
      case SettingsSection.profile:
        return localizations.profileTitle;
    }
  }
}

typedef ItemCallback = VoidCallback Function(String location);

List<ListItemViewModel<String>> _makeMainSectionItems(
  ItemCallback onNavPressed,
  AppLocalizations localizations,
  SettingsActions actions,
) {
  return [
    ListItemViewModel(
      "profile",
      title: localizations.profileTitle,
      iconData: Icons.person,
      onPressed: onNavPressed(const ProfileRoute().location),
    ),
    ListItemViewModel(
      "appearance",
      title: localizations.appearanceTitle,
      iconData: Icons.dark_mode,
      onPressed: onNavPressed(
        const ChooseOptionRoute(ChooseOptionType.theme).location,
      ),
    ),
    ListItemViewModel(
      "logout",
      title: localizations.logout,
      iconData: Icons.logout,
      onPressed: () => actions.logout,
    ),
  ];
}

List<ListItemViewModel<String>> _makeProfileSectionItems(
  ItemCallback onNavPressed,
  AppLocalizations localizations,
) {
  return [
    ListItemViewModel(
      "profile",
      title: localizations.updatePersonalInfoTitle,
      iconData: Icons.person,
      onPressed: onNavPressed(const UpdateProfileRoute().location),
    ),
    ListItemViewModel(
      "addresses",
      title: localizations.addresses,
      iconData: Icons.home,
      onPressed: onNavPressed(const AddressesRoute().location),
    ),
  ];
}
