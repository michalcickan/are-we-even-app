import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:areweeven/global_providers/current_group_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/utils/extensions/go_router_context.dart';
import 'package:areweeven/utils/list_section.dart';
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

  void didTapAddExpense() {
    return;
  }
}

@riverpod
FutureOr<List<ListSection<String>>> homeSections(HomeSectionsRef ref) async {
  final client = ref.watch(aweApiClientProvider);
  final group = await ref.watch(currentGroupProvider.future);

  final expenses = await client.getAllExpenses(group!.id);
  // Perform other operations based on expenses if needed.
  return []; // Return your result here.
}
