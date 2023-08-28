import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:areweeven/global_providers/current_group_provider.dart';
import 'package:areweeven/global_providers/global_error_provider.dart';
import 'package:areweeven/global_providers/go_router_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/utils/extensions/go_router_context.dart';
import 'package:areweeven/utils/string_utils.dart';
import 'package:areweeven/utils/update_value_mixin.dart';
import 'package:awe_api/awe_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_expense_providers.g.dart';

class AddExpenseTexts {
  final String title;
  final String? description;
  final String expenseDescriptionHint;
  final String bottomButtonTitle;

  AddExpenseTexts({
    required this.title,
    this.description,
    required this.expenseDescriptionHint,
    required this.bottomButtonTitle,
  });
}

@riverpod
AddExpenseTexts addExpenseTexts(AddExpenseTextsRef ref) {
  final localizations = ref.watch(localizationProvider);
  return AddExpenseTexts(
    title: localizations.addExpenseTitle,
    description: localizations.addExpenseDescription,
    expenseDescriptionHint: localizations.expenseDescriptionHint,
    bottomButtonTitle: localizations.save,
  );
}

@riverpod
class AddExpenseActions extends _$AddExpenseActions
    with ProviderRouterContextMixin {
  @override
  void build() {}

  Future<void> didTapBottomButton() async {
    try {
      final groupId = ref.read(currentGroupProvider).value!.id;
      final addExpenseMemberItems = ref
          .read(
            addExpenseMemberItemsProvider(groupId),
          )
          .value!;
      final payerParameters = addExpenseMemberItems.map(
        (e) => ExpensePayerParameters(
          id: e.shouldPay.provider.userId,
          paidAmount: ref.read(e.paid.provider.notifier).state.doubleValue,
          dueAmount: ref.read(e.shouldPay.provider.notifier).state.doubleValue,
        ),
      );
      final result = await ref.read(aweApiClientProvider).addExpense(
            groupId,
            AddExpenseParameters(
              users: payerParameters.toList(),
              description: ref.read(addExpenseDescriptionProvider),
            ),
          );
      ref.read(goRouterProvider).pop(result);
    } catch (e) {
      ref.read(globalErrorProvider.notifier).showError(e);
    }
  }
}

@riverpod
class AddExpenseDescription extends _$AddExpenseDescription with UpdateValue {
  @override
  String build() {
    return "";
  }
}

@riverpod
bool addExpenseBottomButtonEnabled(AddExpenseBottomButtonEnabledRef ref) {
  return ref.watch(addExpenseDescriptionProvider).isNotEmpty;
}

@riverpod
Future<List<AddExpenseMemberItem>> addExpenseMemberItems(
  AddExpenseMemberItemsRef ref,
  int groupId,
) async {
  final members = await ref.read(aweApiClientProvider).getGroupMembers(groupId);
  final localizations = ref.watch(localizationProvider);

  return members
      .map(
        (member) => AddExpenseMemberItem(
          name: member.name ?? member.email,
          shouldPay: AddExpenseMemberItemPrice(
            addExpensePriceProvider(
              member.id,
              PriceType.shouldPay,
            ),
            localizations.shouldPayHint,
          ),
          paid: AddExpenseMemberItemPrice(
            addExpensePriceProvider(
              member.id,
              PriceType.paid,
            ),
            localizations.paidHint,
          ),
        ),
      )
      .toList();
}

class AddExpenseMemberItemPrice {
  final AddExpensePriceProvider provider;
  final String placeholder;

  AddExpenseMemberItemPrice(
    this.provider,
    this.placeholder,
  );
}

class AddExpenseMemberItem {
  final String name;
  final AddExpenseMemberItemPrice shouldPay;
  final AddExpenseMemberItemPrice paid;

  AddExpenseMemberItem({
    required this.name,
    required this.shouldPay,
    required this.paid,
  });
}

enum PriceType {
  shouldPay,
  paid,
}

@riverpod
class AddExpensePrice extends _$AddExpensePrice {
  @override
  String build(int userId, PriceType type) {
    return "";
  }
}
