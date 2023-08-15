import 'package:areweeven/pages/update_profile/update_profile_providers.dart';
import 'package:areweeven/widgets/awe_text_field.dart';
import 'package:areweeven/widgets/scrollable_page_with_bottom_button.dart';
import 'package:awe_api/awe_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateProfilePage extends ConsumerWidget {
  const UpdateProfilePage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final texts = ref.watch(updateProfileTextsProvider);
    final user = ref.watch(updateProfileUserProvider);

    return ScrollablePageWithBottomButton(
      title: texts.title,
      bottomButtonTitle: texts.bottomButtonTitle,
      onBottomButtonPressed: () =>
          ref.read(updateProfileActionsProvider.notifier).didTapBottomButton(),
      children: [
        AWETextField(
          hintText: texts.namePlaceholder,
          initialValue: user?.name,
          onValueChanged: (value) {
            ref.setUser(
              user?.copyWith(
                name: value,
              ),
            );
          },
        ),
        AWETextField(
          hintText: texts.middleNamePlaceholder,
          initialValue: user?.middleName,
          onValueChanged: (value) {
            ref.setUser(
              user?.copyWith(
                middleName: value,
              ),
            );
          },
        ),
        AWETextField(
          hintText: texts.surnamePlaceholder,
          initialValue: user?.surname,
          onValueChanged: (value) {
            ref.setUser(
              user?.copyWith(
                surname: value,
              ),
            );
          },
        )
      ],
    );
  }
}

extension _Set on WidgetRef {
  void setUser(User? user) {
    read(updateProfileUserProvider.notifier).state = user;
  }
}
