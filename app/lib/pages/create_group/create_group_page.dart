import 'package:areweeven/widgets/awe_text_field.dart';
import 'package:areweeven/widgets/page_scaffold.dart';
import 'package:areweeven/widgets/scrollable_page_with_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'create_group_providers.dart';

class CreateGroup extends ConsumerWidget {
  const CreateGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.watch(createGroupTextsProvider);

    return ScrollablePageWithBottomButton(
      appBarData: AppBarData(
        title: texts.title,
      ),
      bottomButtonTitle: texts.bottomButtonTitle,
      onBottomButtonPressed: ref.watch(createGroupBottomButtonEnabledProvider)
          ? () =>
              ref.read(createGroupActionsProvider.notifier).didTapBottomButton()
          : null,
      children: [
        AWETextField(
          TextFieldType.basic,
          hintText: texts.groupNamePlaceholder,
          onValueChanged: (value) =>
              ref.read(createGroupNameProvider.notifier).updateValue(value),
        ),
      ],
    );
  }
}
