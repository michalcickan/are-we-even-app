import 'package:areweeven/pages/settings/settings_providers.dart';
import 'package:areweeven/widgets/awe_list_view.dart';
import 'package:areweeven/widgets/list_item/awe_list_item.dart';
import 'package:areweeven/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  final SettingsSection section;

  const SettingsPage(
    this.section, {
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final texts = ref.watch(settingsTextsProvider(section));
    final items = ref.watch(settingListItemsProvider(section));
    return PageScaffold(
      title: texts.title,
      body: AWEListView(
        ListViewType.defaultIndentation,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          final data = item.type.info;

          return AWEListItem(
            ListItemType.option,
            title: item.title,
            onPressed: item.onPressed,
            iconData: data.iconData,
            trailingType: data.trailingType,
            key: ValueKey(index),
          );
        },
      ),
    );
  }
}

extension _UI on SettingItemType {
  _SettingsUIItemInfo get info => when(
      profile: () => _SettingsUIItemInfo(
            Icons.person,
            trailingType: const ListItemTrailingType.navigation(),
          ),
      appearance: () => _SettingsUIItemInfo(
            Icons.dark_mode,
            trailingType: const ListItemTrailingType.navigation(),
          ),
      updateProfileInfo: () => _SettingsUIItemInfo(
            Icons.edit,
            trailingType: const ListItemTrailingType.navigation(),
          ),
      addresses: () => _SettingsUIItemInfo(
            Icons.home,
            trailingType: const ListItemTrailingType.navigation(),
          ),
      logout: () => _SettingsUIItemInfo(
            Icons.logout,
          ));
}

class _SettingsUIItemInfo {
  IconData iconData;
  ListItemTrailingType? trailingType;

  _SettingsUIItemInfo(
    this.iconData, {
    this.trailingType,
  });
}
