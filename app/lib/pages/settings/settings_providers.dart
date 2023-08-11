import 'dart:ui';

import 'package:areweeven/extensions/go_router_context.dart';
import 'package:areweeven/gen/app_localizations.dart';
import 'package:areweeven/global_providers/auth_provider.dart';
import 'package:areweeven/global_providers/dialog_provider.dart';
import 'package:areweeven/global_providers/go_router_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/pages/choose_option/choose_option_providers.dart';
import 'package:areweeven/routes/routes.dart';
import 'package:areweeven/routes/settings_routes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_providers.freezed.dart';
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
      onNavPressed(
        const ChooseOptionRoute(ChooseOptionType.theme).location,
      ),
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
      localizations.addresses,
      const SettingItemType.addresses(),
      onNavPressed(const AddressesRoute().location),
    ),
  ];
}

@freezed
class SettingItemType with _$SettingItemType {
  const factory SettingItemType.profile() = Profile;

  // const factory SettingItemType.darkMode(
  //   bool value,
  //   void Function(bool) onValueChanged,
  // ) = Appearance;
  const factory SettingItemType.appearance() = Appearance;

  const factory SettingItemType.updateProfileInfo() = UpdateProfileInfo;

  const factory SettingItemType.addresses() = Addresses;

  const factory SettingItemType.logout() = Logout;
}

class SettingListItem {
  final String title;
  final SettingItemType type;
  final Function() onPressed;

  SettingListItem(
    this.title,
    this.type,
    this.onPressed,
  );
}
