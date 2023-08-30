import 'package:areweeven/global_providers/current_group_provider.dart';
import 'package:areweeven/widgets/list_item_builders/list_item_builder.dart';
import 'package:areweeven/widgets/page_scaffold.dart';
import 'package:awe_widgets/awe_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'expense_list_providers.dart';

class ExpenseListPage extends ConsumerWidget {
  // https://github.com/flutter/flutter/issues/129878
  // final int groupId;

  const ExpenseListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.watch(expenseListTextsProvider);
    final groupExpenseListItemsProvider = expenseListItemsProvider(
      ref.watch(currentGroupProvider).value?.id ?? 0,
    );

    return PageScaffold(
      appBarData: AppBarData(
        title: texts.title,
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(groupExpenseListItemsProvider.notifier).refreshData(),
        child: ref.watch(groupExpenseListItemsProvider).maybeWhen(
              data: (data) => AWEListView(
                ListViewType.defaultIndentation,
                emptyText: '',
                listViewItemsBuilder: AppListItemsBuilder.fromViewModels(
                  data,
                ),
              ),
              orElse: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
      ),
    );
  }
}
