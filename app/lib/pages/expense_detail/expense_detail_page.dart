import 'package:areweeven/utils/extensions/build_context_themes.dart';
import 'package:areweeven/widgets/page_scaffold.dart';
import 'package:areweeven/widgets/scrollable_content.dart';
import 'package:awe_widgets/awe_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'expense_detail_providers.dart';

class ExpenseDetailPage extends ConsumerWidget {
  final int expenseId;

  const ExpenseDetailPage(
    this.expenseId, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.watch(expenseDetailTextsProvider(expenseId));
    final dueAmounts = ref.watch(expenseDetailChartDataProvider(expenseId));

    return PageScaffold(
      appBarData: AppBarData(
        title: texts.title,
      ),
      body: dueAmounts.maybeWhen(
        data: (data) => ScrollableContent(
          scrollContent: [
            _makeBasicInfo(
              ref.watch(
                expenseDetailBasicInfoProvider(expenseId),
              ),
              context,
            ),
            const SizedBox(
              height: AWESizes.medium,
            ),
            ..._makeCharts(data),
          ],
        ),
        orElse: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _makeBasicInfo(
    ExpenseDetailBasicInfo basicInfo,
    BuildContext context,
  ) {
    final entries = basicInfo.items.entries.toList();

    if (entries.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return AWECard(
      CardType.defaultIndentation,
      child: Column(
        children: [
          Text(
            basicInfo.expenseTitle,
            style: context.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: AWESizes.medium,
          ),
          for (var index = 0; index < entries.length; index++)
            _buildInfoRow(entries[index], index, entries.length),
        ],
      ),
    );
  }

  Iterable<Widget> _makeCharts(Map<String, ChartData> data) => data.entries.map(
        (entry) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.key,
            ),
            Flexible(
              child: AWEPieChart(
                PieChartType.normal,
                dataMap: entry.value.data,
              ),
            ),
            const SizedBox(
              height: AWESizes.large,
            ),
          ],
        ),
      );

  Widget _buildInfoRow(
      MapEntry<String, String> entry, int index, int totalEntries) {
    return Padding(
      padding: EdgeInsets.only(bottom: index + 1 < totalEntries ? 10 : 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(entry.key),
          Text(entry.value),
        ],
      ),
    );
  }
}
