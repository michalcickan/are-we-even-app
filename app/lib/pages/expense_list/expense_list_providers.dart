import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/utils/extensions/go_router_context.dart';
import 'package:areweeven/view_models/list_item_view_model.dart';
import 'package:awe_api/awe_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expense_list_providers.g.dart';

class ExpenseListTexts {
  final String title;

  ExpenseListTexts({
    required this.title,
  });
}

@riverpod
ExpenseListTexts expenseListTexts(ExpenseListTextsRef ref) {
  final localizations = ref.watch(localizationProvider);
  return ExpenseListTexts(
    title: localizations.expenseListTitle,
  );
}

@riverpod
class ExpenseListActions extends _$ExpenseListActions
    with ProviderRouterContextMixin {
  @override
  void build() {}

  void didTapExpense(Expense expense) {
    return;
  }
}

@riverpod
class ExpenseListItems extends _$ExpenseListItems {
  final int _limit = 50;

  @override
  FutureOr<List<ListItemViewModel>> build(int groupId) async {
    final pagedData = await _fetchPagedData(refresh: true);
    return _makeItems(pagedData.data);
  }

  Future<void> refreshData() async {
    final newData = await _fetchPagedData(refresh: true);
    state = AsyncValue.data(_makeItems(newData.data));
  }

  Future<void> loadNext() async {
    final newData = await _fetchPagedData(refresh: false);
    final prevValue = state.value ?? [];
    prevValue.addAll(_makeItems(newData.data));
    state = AsyncValue.data(prevValue);
  }

  Future<PagedDataResponse<Expense>> _fetchPagedData({
    required bool refresh,
  }) async {
    return await ref.read(aweApiClientProvider).getAllExpenses(
          groupId,
          AllExpensesParameters(
            limit: _limit,
            offset: refresh ? 0 : state.value?.length ?? 0,
          ),
        );
  }

  List<ListItemViewModel> _makeItems(
    List<Expense>? expenses,
  ) {
    final localizations = ref.watch(localizationProvider);
    return expenses
            ?.map(
              (e) => ListItemViewModel.fromExpense(
                e,
                localizations: localizations,
                onPressed: (expense) => ref
                    .read(expenseListActionsProvider.notifier)
                    .didTapExpense(expense),
              ),
            )
            .toList() ??
        [];
  }
}
