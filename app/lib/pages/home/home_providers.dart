import 'package:areweeven/gen/app_localizations.dart';
import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:areweeven/global_providers/current_group_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/routes/expense_routes.dart';
import 'package:areweeven/routes/routes.dart';
import 'package:areweeven/utils/extensions/go_router_context.dart';
import 'package:areweeven/utils/extensions/user_utils.dart';
import 'package:areweeven/utils/list_section.dart';
import 'package:areweeven/view_models/card_list_item_view_model.dart';
import 'package:areweeven/view_models/list_item_view_model.dart';
import 'package:areweeven/view_models/text_deliminator.dart';
import 'package:awe_api/awe_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_providers.g.dart';

class HomeTexts {
  final String title;
  final String emptyListPlaceholder;
  final String addExpenseTitle;

  HomeTexts({
    required this.title,
    required this.emptyListPlaceholder,
    required this.addExpenseTitle,
  });
}

@riverpod
HomeTexts homeTexts(HomeTextsRef ref) {
  final localizations = ref.watch(localizationProvider);
  return HomeTexts(
    title: localizations.homeTabTitle,
    addExpenseTitle: localizations.expenseTitle,
    emptyListPlaceholder: ref.watch(currentGroupProvider).maybeWhen(
          data: (group) => localizations.noExpensesInGroup(
            group?.name ?? "",
          ),
          orElse: () => "",
        ),
  );
}

@riverpod
class HomeActions extends _$HomeActions with ProviderRouterContextMixin {
  @override
  void build() {}

  Future<void> didTapAddExpense() async {
    await AddExpenseRoute(_groupId).push(context);
    ref.refresh(homeSectionsProvider);
  }

  void didTapShowAllExpenses() {
    const ExpenseListRoute().push(context);
  }

  void didTapExpense(Expense expense) {
    ExpenseDetailRoute(expense.id).push(context);
  }

  Future<void> didTapRefresh() async {
    ref.refresh(homeSectionsProvider);
  }

  int get _groupId => ref.read(currentGroupProvider).value!.id;
}

@riverpod
FutureOr<List<ListSection<String>>> homeSections(HomeSectionsRef ref) async {
  const maxExpensesLength = 3;
  final client = ref.watch(aweApiClientProvider);
  final groupId = (await ref.watch(currentGroupProvider.future))!.id;
  final localizations = ref.watch(localizationProvider);
  final debts = await client.getDebts(groupId);
  final pagedExpenses = await client.getAllExpenses(
    groupId,
    AllExpensesParameters(
      offset: 0,
      limit: maxExpensesLength,
      sortType: SortType.desc,
    ),
  );
  if (pagedExpenses.data?.isEmpty ?? true) {
    return [];
  }
  final actions = ref.watch(homeActionsProvider.notifier);

  return [
    ListSection(
      "",
      debts.viewModels(
        localizations,
        actions,
      ),
    ),
    ListSection(
      localizations.homeExpensesSectionTitle,
      pagedExpenses.data!.viewModels(
        localizations,
        actions,
      ),
      rightItem: maxExpensesLength < (pagedExpenses.meta?.totalCount ?? 0)
          ? SectionRightItem.more(
              localizations.seeAll,
              actions.didTapShowAllExpenses,
            )
          : null,
    )
  ]; // Return your result here.
}

extension _Expenses on List<Expense> {
  List<ListItemViewModel> viewModels(
    AppLocalizations localizations,
    HomeActions actions,
  ) =>
      map(
        (expense) => ListItemViewModel.fromExpense(
          expense,
          localizations: localizations,
          onPressed: actions.didTapExpense,
        ),
      ).toList();
}

extension _Debts on List<Debt> {
  List<CardListItemViewModel> viewModels(
    AppLocalizations localizations,
    HomeActions actions,
  ) =>
      map(
        (debt) => CardListItemViewModel(
          debt.id.toString(),
          upperText: debt.debtor.validName,
          textDeliminator: TextDeliminator.arrowDown(
            additionalInfo: debt?.amountOwed.toString(),
          ),
          bottomText: debt.creditor.validName,
        ),
      ).toList();
}
