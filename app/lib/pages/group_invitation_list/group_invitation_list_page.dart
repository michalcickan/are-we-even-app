import 'package:areweeven/widgets/awe_list_view.dart';
import 'package:areweeven/widgets/list_item_builders/list_item_builder.dart';
import 'package:areweeven/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'group_invitation_list_providers.dart';

class GroupInvitationListPage extends ConsumerWidget {
  const GroupInvitationListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.read(groupInvitationListTextsProvider);
    return PageScaffold(
      appBarData: AppBarData(
        title: texts.title,
      ),
      body: ref.watch(groupInvitationListItemsProvider).maybeWhen(
            data: (data) => AWEListView(
              ListViewType.defaultIndentation,
              listViewItemsBuilder: AppListItemsBuilder.fromViewModels(
                data,
              ),
              emptyText: texts.emptyDataPlaceholder,
            ),
            orElse: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
