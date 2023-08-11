import 'package:areweeven/pages/settings/settings_providers.dart';
import 'package:areweeven/widgets/awe_page_scaffold.dart';
import 'package:areweeven/widgets/settings_options_list.dart';
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

    return AWEPageScaffold(
      title: texts.title,
      body: SettingsOptionsList(
        items: ref.watch(settingListItemsProvider(section)),
      ),
    );
  }
}
