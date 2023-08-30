import 'package:areweeven/pages/settings/settings_providers.dart';
import 'package:areweeven/widgets/list_item_builders/list_item_builder.dart';
import 'package:areweeven/widgets/page_scaffold.dart';
import 'package:awe_widgets/awe_widgets.dart';
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
    final viewModels = ref.watch(settingListItemsProvider(section));
    return PageScaffold(
      appBarData: AppBarData(
        title: texts.title,
      ),
      body: AWEListView(
        ListViewType.defaultIndentation,
        listViewItemsBuilder: AppListItemsBuilder.fromViewModels(viewModels),
        emptyText: "",
      ),
    );
  }
}
