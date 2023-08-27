import 'package:areweeven/widgets/awe_list_view.dart';
import 'package:areweeven/widgets/awe_text_field.dart';
import 'package:areweeven/widgets/list_item_builders/list_item_builder.dart';
import 'package:areweeven/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'add_group_member_providers.dart';

class AddGroupMemberPage extends ConsumerWidget {
  final int groupId;

  const AddGroupMemberPage(
    this.groupId, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.watch(addGroupMemberTextsProvider);
    final results = ref.watch(addGroupSearchResultsProvider(groupId));

    return PageScaffold(
      appBarData: AppBarData(
        searchField: AWETextField(
          TextFieldType.search,
          onValueChanged:
              ref.read(addGroupMemberSearchQueryProvider.notifier).updateValue,
          hintText: texts.searchHint,
        ),
      ),
      body: results.maybeWhen(
        data: (data) => AWEListView(
          ListViewType.defaultIndentation,
          listViewItemsBuilder: AppListItemsBuilder.fromViewModels(data),
          emptyText: ref.watch(emptyListTextProvider),
        ),
        orElse: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
