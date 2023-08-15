import 'package:areweeven/widgets/awe_empty_placeholder.dart';
import 'package:areweeven/widgets/awe_list_view.dart';
import 'package:areweeven/widgets/list_item/awe_list_item.dart';
import 'package:areweeven/widgets/page_scaffold.dart';
import 'package:areweeven/widgets/sizes.dart';
import 'package:awe_api/awe_api.dart';
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
    final items = ref.watch(groupListItemsProvider);

    return PageScaffold(
      title: texts.title,
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
                itemsCount: data.length,
                itemBuilder: (context, index) => _makeItem(
                  data[index],
                  ref,
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

  Widget _makeItem(Group group, WidgetRef ref) => Dismissible(
        key: Key(
          group.id.toString(),
        ),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) {
          ref.read(groupListActionsProvider.notifier).didTapRemoveGroup(
                group,
              );
          return Future.value(false);
        },
        background: Container(
          color: Colors.red, // Background color when swiped
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(
            right: Sizes.medium,
          ),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        child: AWEListItem(
          ListItemType.option,
          title: group.name,
          key: ValueKey(group.id),
        ),
      );
}
