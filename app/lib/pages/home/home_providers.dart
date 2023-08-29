import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:areweeven/global_providers/current_group_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/routes/expense_routes.dart';
import 'package:areweeven/routes/routes.dart';
import 'package:areweeven/utils/extensions/go_router_context.dart';
import 'package:areweeven/utils/list_section.dart';
import 'package:areweeven/view_models/list_item_view_model.dart';
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

  int get _groupId => ref.read(currentGroupProvider).value!.id;
}

@riverpod
FutureOr<List<ListSection<String>>> homeSections(HomeSectionsRef ref) async {
  const maxExpensesLength = 3;
  final client = ref.watch(aweApiClientProvider);
  final group = await ref.watch(currentGroupProvider.future);
  final localizations = ref.watch(localizationProvider);
  final pagedExpenses = await client.getAllExpenses(
    group!.id,
    AllExpensesParameters(
      offset: 0,
      limit: maxExpensesLength,
      sortType: SortType.desc,
    ),
  );
  if (pagedExpenses.data?.isEmpty ?? true) {
    return [];
  }

  return [
    ListSection(
      localizations.homeExpensesSectionTitle,
      pagedExpenses.data!
          .map(
            (expense) => ListItemViewModel.fromExpense(
              expense,
              localizations: localizations,
              onPressed: (expense) {},
            ),
          )
          .toList(),
      rightItem: maxExpensesLength < (pagedExpenses.meta?.totalCount ?? 0)
          ? SectionRightItem.more(
              localizations.seeAll,
              () => ref
                  .read(homeActionsProvider.notifier)
                  .didTapShowAllExpenses(),
            )
          : null,
    )
  ]; // Return your result here.
}
