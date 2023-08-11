import 'package:areweeven/utils/settings_item_type.dart';
import 'package:areweeven/widgets/list_item/awe_list_item.dart';
import 'package:flutter/material.dart';

import 'awe_list_view.dart';

class SettingsOptionsList extends StatelessWidget {
  final List<SettingListItem> items;

  const SettingsOptionsList({
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AWEListView(
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
      addAddress: () => _SettingsUIItemInfo(
            Icons.add,
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
