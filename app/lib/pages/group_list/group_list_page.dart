import 'package:areweeven/widgets/awe_empty_placeholder.dart';
import 'package:areweeven/widgets/awe_list_view.dart';
import 'package:areweeven/widgets/list_item_builders/list_item_builder.dart';
import 'package:areweeven/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'group_list_providers.dart';

class GroupListPage extends ConsumerWidget {
  const GroupListPage({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final texts = ref.watch(groupListTextsProvider);
    final items = ref.watch(groupListSectionsProvider);

    return PageScaffold(
      appBarData: AppBarData(
        title: texts.title,
      ),
      floatingButton: FloatingButton(
        iconData: Icons.group_add,
        onPressed: () =>
            ref.read(groupListActionsProvider.notifier).didTapAdd(),
      ),
      body: items.when(
        data: (data) => data.isEmpty
            ? AWEEmptyPlaceholder(
                EmptyPlaceholderType.list,
                text: texts.emptyDataPlaceholder,
              )
            : AWEListView(
                ListViewType.defaultIndentation,
                listViewItemsBuilder: AppListItemsBuilder.fromSections(
                  data,
                ),
              ),
        error: (object, stackTrace) => Center(
          child: Text(
            object.toString(),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
