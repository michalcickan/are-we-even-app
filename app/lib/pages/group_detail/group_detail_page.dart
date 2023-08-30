import 'package:areweeven/widgets/list_item_builders/list_item_builder.dart';
import 'package:areweeven/widgets/page_scaffold.dart';
import 'package:awe_widgets/awe_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'group_detail_providers.dart';

class GroupDetailPage extends ConsumerWidget {
  final int groupId;

  const GroupDetailPage(
    this.groupId, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.watch(groupDetailTextsProvider(groupId));
    final showFloatingButton =
        ref.watch(groupDetailShowSwitchToProvider(groupId));

    return PageScaffold(
      appBarData: AppBarData(
        title: texts.title,
        rightActions: [
          AppBarAction(
            onPressed: () => ref.actions.didTapAddUser(groupId),
            iconData: Icons.person_add,
          ),
        ],
      ),
      floatingButton: showFloatingButton
          ? FloatingButton(
              iconData: Icons.group,
              title: texts.bottomButtonTitle,
              onPressed: () => ref.actions.didTapSetDefault(groupId),
            )
          : null,
      body: ref.watch(groupDetailSectionsProvider(groupId)).maybeWhen(
            data: (section) => RefreshIndicator(
              onRefresh: () => ref
                  .refresh(groupDetailActionsProvider.notifier)
                  .didTapRefresh(
                    groupId,
                  ),
              child: AWEListView(
                ListViewType.defaultIndentation,
                listViewItemsBuilder: AppListItemsBuilder.fromSections(
                  section,
                ),
                emptyText: "",
              ),
            ),
            orElse: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}

extension _Actions on WidgetRef {
  GroupDetailActions get actions => read(groupDetailActionsProvider.notifier);
}
