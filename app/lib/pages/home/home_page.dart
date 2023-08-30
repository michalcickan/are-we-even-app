import 'package:areweeven/pages/home/home_providers.dart';
import 'package:areweeven/widgets/list_item_builders/list_item_builder.dart';
import 'package:areweeven/widgets/page_scaffold.dart';
import 'package:awe_widgets/awe_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.watch(homeTextsProvider);
    final sections = ref.watch(homeSectionsProvider);

    return PageScaffold(
      appBarData: AppBarData(
        title: texts.title,
      ),
      floatingButton: sections.maybeWhen(
        data: (data) => FloatingButton(
          iconData: Icons.add,
          title: texts.addExpenseTitle,
          onPressed: () =>
              ref.read(homeActionsProvider.notifier).didTapAddExpense(),
        ),
        orElse: () => null,
      ),
      body: sections.maybeWhen(
        orElse: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (sections) => RefreshIndicator(
          onRefresh: () =>
              ref.read(homeActionsProvider.notifier).didTapRefresh(),
          child: AWEListView(
            ListViewType.defaultIndentation,
            emptyText: texts.emptyListPlaceholder,
            listViewItemsBuilder: AppListItemsBuilder.fromSections(
              sections,
            ),
          ),
        ),
      ),
    );
  }
}
