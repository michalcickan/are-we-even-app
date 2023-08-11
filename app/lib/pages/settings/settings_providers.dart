import 'dart:ui';

import 'package:areweeven/extensions/go_router_context.dart';
import 'package:areweeven/gen/app_localizations.dart';
import 'package:areweeven/global_providers/auth_provider.dart';
import 'package:areweeven/global_providers/go_router_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/routes/routes.dart';
import 'package:areweeven/routes/settings_routes.dart';
import 'package:areweeven/utils/settings_item_type.dart';
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
    ref.read(authProvider.notifier).logout();
  }
}

@riverpod
List<SettingListItem> settingListItems(
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

List<SettingListItem> _makeMainSectionItems(
  ItemCallback onNavPressed,
  AppLocalizations localizations,
  SettingsActions actions,
) {
  return [
    SettingListItem(
      localizations.profileTitle,
      const SettingItemType.profile(),
      onNavPressed(const ProfileRoute().location),
    ),
    SettingListItem(
      localizations.appearanceTitle,
      const SettingItemType.appearance(),
      onNavPressed(const AppearanceRoute().location),
    ),
    SettingListItem(
      localizations.logout,
      const SettingItemType.logout(),
      actions.logout,
    ),
  ];
}

List<SettingListItem> _makeProfileSectionItems(
  ItemCallback onNavPressed,
  AppLocalizations localizations,
) {
  return [
    SettingListItem(
      localizations.updatePersonalInfoTitle,
      const SettingItemType.profile(),
      onNavPressed(const UpdateProfileRoute().location),
    ),
    SettingListItem(
      localizations.updateAddresses,
      const SettingItemType.appearance(),
      onNavPressed(const UpdateAddresses().location),
    ),
  ];
}
