import 'package:areweeven/pages/groups_list/groups_list_providers.dart';
import 'package:areweeven/widgets/awe_empty_placeholder.dart';
import 'package:areweeven/widgets/awe_list_view.dart';
import 'package:areweeven/widgets/awe_page_scaffold.dart';
import 'package:areweeven/widgets/list_item/awe_list_item.dart';
import 'package:awe_api/awe_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupsListPage extends ConsumerWidget {
  const GroupsListPage({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final texts = ref.watch(groupsListTextsProvider);
    final items = ref.watch(groupsListItemsProvider);
    return AWEPageScaffold(
      title: texts.title,
      floatingButton: FloatingButton(
        FloatingButtonType.add,
        onPressed: () =>
            ref.read(groupsListActionsProvider.notifier).didTapAdd(),
      ),
      body: items.when(
        data: (data) => data.isEmpty
            ? AWEEmptyPlaceholder(
                EmptyPlaceholderType.list,
                text: texts.emptyDataPlaceholder,
              )
            : AWEListView(
                ListViewType.defaultIndentation,
                itemCount: data.length,
                itemBuilder: (context, index) => _makeItem(
                  data[index],
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

  Widget _makeItem(Group group) => AWEListItem(
        ListItemType.option,
        title: group.name,
        key: ValueKey(group.id),
      );
}
