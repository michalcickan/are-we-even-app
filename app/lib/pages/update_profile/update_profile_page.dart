import 'package:areweeven/pages/update_profile/update_profile_providers.dart';
import 'package:areweeven/widgets/page_scaffold.dart';
import 'package:areweeven/widgets/scrollable_page_with_bottom_button.dart';
import 'package:awe_api/awe_api.dart';
import 'package:awe_widgets/awe_widgets.dart';
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
      appBarData: AppBarData(
        title: texts.title,
      ),
      bottomButton: BottomButton(
        title: texts.title,
        onPressed: () => ref
            .read(updateProfileActionsProvider.notifier)
            .didTapBottomButton(),
      ),
      children: [
        AWETextField(
          TextFieldType.basic,
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
        _spacer,
        AWETextField(
          TextFieldType.basic,
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
        _spacer,
        AWETextField(
          TextFieldType.basic,
          hintText: texts.surnamePlaceholder,
          initialValue: user?.surname,
          onValueChanged: (value) {
            ref.setUser(
              user?.copyWith(
                surname: value,
              ),
            );
          },
        ),
        _spacer,
      ],
    );
  }

  Widget get _spacer => const SizedBox(
        height: AWESizes.medium,
      );
}

extension _Set on WidgetRef {
  void setUser(User? user) {
    read(updateProfileUserProvider.notifier).state = user;
  }
}
