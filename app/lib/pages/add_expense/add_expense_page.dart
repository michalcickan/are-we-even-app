import 'package:areweeven/widgets/awe_card.dart';
import 'package:areweeven/widgets/awe_text_field.dart';
import 'package:areweeven/widgets/page_scaffold.dart';
import 'package:areweeven/widgets/scrollable_page_with_bottom_button.dart';
import 'package:areweeven/widgets/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'add_expense_providers.dart';

class AddExpensePage extends ConsumerWidget {
  final int groupId;

  const AddExpensePage(
    this.groupId, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.watch(addExpenseTextsProvider);
    final members = ref.watch(addExpenseMemberItemsProvider(groupId));

    return ScrollablePageWithBottomButton(
      appBarData: AppBarData(
        title: texts.title,
      ),
      bottomButton: members.maybeWhen(
        data: (_) => BottomButton(
          title: texts.bottomButtonTitle,
          onPressed: ref.watch(addExpenseBottomButtonEnabledProvider)
              ? () => ref
                  .read(addExpenseActionsProvider.notifier)
                  .didTapBottomButton()
              : null,
        ),
        orElse: () => null,
      ),
      children: members.maybeWhen(
        data: (data) => [
          if (texts.description != null)
            Text(
              texts.description!,
            ),
          const SizedBox(
            height: Sizes.doubleLarge,
          ),
          AWETextField(
            TextFieldType.basic,
            hintText: texts.expenseDescriptionHint,
            onValueChanged:
                ref.read(addExpenseDescriptionProvider.notifier).updateValue,
          ),
          const SizedBox(
            height: Sizes.largeSmall,
          ),
          ..._makeInputs(data, ref),
        ],
        orElse: () => [
          const Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }

  Iterable<Widget> _makeInputs(
    List<AddExpenseMemberItem> members,
    WidgetRef ref,
  ) =>
      members.map(
        (member) => AWECard(
          CardType.defaultIndentation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(member.name),
              ),
              const SizedBox(
                height: Sizes.small,
              ),
              Row(
                children: [
                  Expanded(
                    child: member.shouldPay.input(ref),
                  ),
                  const SizedBox(
                    width: Sizes.small,
                  ),
                  Expanded(
                    child: member.paid.input(ref),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}

extension _Inputs on AddExpenseMemberItemPrice {
  Widget input(WidgetRef ref) => AWETextField(
        TextFieldType.basic,
        hintText: placeholder,
        initialValue: ref.watch(provider),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        onValueChanged: (value) {
          final val = ref.read(provider.notifier).state;
          ref.read(provider.notifier).state = value;
        },
      );
}
