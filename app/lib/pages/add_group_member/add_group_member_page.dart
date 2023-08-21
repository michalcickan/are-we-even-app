import 'package:areweeven/widgets/awe_list_view.dart';
import 'package:areweeven/widgets/awe_text_field.dart';
import 'package:areweeven/widgets/list_item/awe_list_item.dart';
import 'package:areweeven/widgets/page_scaffold.dart';
import 'package:awe_api/awe_api.dart';
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
    final results = ref.watch(addGroupSearchResultsProvider);

    return PageScaffold(
      appBarSearchField: AWETextField(
        TextFieldType.search,
        onValueChanged:
            ref.read(addGroupMemberSearchQueryProvider.notifier).updateValue,
        hintText: texts.searchHint,
      ),
      body: results.maybeWhen(
        data: (data) => AWEListView(
          ListViewType.defaultIndentation,
          itemsCount: data.length,
          itemBuilder: (context, index) => _makeItem(data[index]),
        ),
        orElse: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _makeItem(User user) => AWEListItem(
        ListItemType.option,
        title: user.email,
        subtitle: user.name,
      );
}
