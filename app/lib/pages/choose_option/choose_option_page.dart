import 'package:areweeven/widgets/awe_list_view.dart';
import 'package:areweeven/widgets/awe_page_scaffold.dart';
import 'package:areweeven/widgets/list_item/awe_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'choose_option_item.dart';
import 'choose_option_providers.dart';

class ChooseOptionPage extends ConsumerWidget {
  final ChooseOptionType type;

  const ChooseOptionPage(
    this.type, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.watch(chooseOptionTextsProvider(type));
    final items = ref.watch(chooseOptionItemsProvider(type));

    return AWEPageScaffold(
      title: texts.title,
      body: AWEListView(
        ListViewType.defaultIndentation,
        itemCount: items.length,
        itemBuilder: (context, index) => _makeItem(
          items[index],
        ),
      ),
    );
  }

  Widget _makeItem(ChooseOptionItem item) => AWEListItem(
        ListItemType.option,
        title: item.title,
        onPressed: item.onPressed,
        trailingType:
            item.selected ? const ListItemTrailingType.checkbox() : null,
      );
}
