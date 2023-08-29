import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/utils/extensions/go_router_context.dart';
import 'package:awe_api/awe_api.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expense_detail_providers.g.dart';

class ExpenseDetailTexts {
  final String title;

  ExpenseDetailTexts({
    required this.title,
  });
}

@riverpod
ExpenseDetailTexts expenseDetailTexts(
    ExpenseDetailTextsRef ref, int expenseId) {
  final localizations = ref.watch(localizationProvider);
  return ExpenseDetailTexts(title: localizations.expenseTitle);
}

@riverpod
FutureOr<Expense> _expenseDetail(_ExpenseDetailRef ref, int expenseId) {
  return ref.watch(aweApiClientProvider).getExpense(expenseId);
}

@riverpod
class ExpenseDetailActions extends _$ExpenseDetailActions
    with ProviderRouterContextMixin {
  @override
  void build() {}
}

class ExpenseDetailBasicInfo {
  String expenseTitle;
  Map<String, String> items;

  ExpenseDetailBasicInfo(
    this.expenseTitle,
    this.items,
  );
}

@riverpod
ExpenseDetailBasicInfo expenseDetailBasicInfo(
  ExpenseDetailBasicInfoRef ref,
  int expenseId,
) {
  final localizations = ref.watch(localizationProvider);
  return ref.watch(_expenseDetailProvider(expenseId)).maybeWhen(
        data: (data) => ExpenseDetailBasicInfo(
          data.description,
          {
            localizations.totalAmountTitle: data.totalAmount.toStringAsFixed(2),
            localizations.createdAtTitle: DateFormat("d.MMM H:mm").format(
              data.createdAt ?? DateTime.now(),
            ),
          },
        ),
        orElse: () => ExpenseDetailBasicInfo("", {}),
      );
}

@riverpod
Future<Map<String, ChartData>> expenseDetailChartData(
    ExpenseDetailChartDataRef ref, int expenseId) async {
  final data = await ref.watch(_expenseDetailProvider(expenseId).future);
  final localizations = ref.watch(localizationProvider);
  if (data.participants == null) return {};

  final shouldPayEntries = data.participants!.map(
    (e) => MapEntry<String, double>(
      e.validName,
      e.dueAmount,
    ),
  );

  final paidEntries = data.participants!.map(
    (e) => MapEntry<String, double>(
      e.validName,
      e.paidAmount,
    ),
  );

  return {
    localizations.dueAmountTitle: ChartData(
      data.totalAmount.toString(),
      Map.fromEntries(shouldPayEntries),
    ),
    localizations.paidHint: ChartData(
      data.totalAmount.toString(),
      Map.fromEntries(paidEntries),
    ),
  };
}

class ChartData {
  final String total;
  final Map<String, double> data;

  const ChartData(
    this.total,
    this.data,
  );
}

extension _Utils on ExpenseUser {
  String get validName => name ?? email;
}
