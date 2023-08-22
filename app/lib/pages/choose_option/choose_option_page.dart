import 'package:areweeven/widgets/awe_list_view.dart';
import 'package:areweeven/widgets/list_item_builders/list_item_builder.dart';
import 'package:areweeven/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    return PageScaffold(
      appBarData: AppBarData(
        title: texts.title,
      ),
      body: AWEListView(
        ListViewType.defaultIndentation,
        listViewItemsBuilder: AppListItemsBuilder.fromViewModels(
          ref.watch(
            chooseOptionItemsProvider(type),
          ),
        ),
      ),
    );
  }
}
