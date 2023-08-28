import 'package:areweeven/pages/registration/registration_providers.dart';
import 'package:areweeven/utils/text_field_info.dart';
import 'package:areweeven/widgets/page_scaffold.dart';
import 'package:areweeven/widgets/scrollable_page_with_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationPage extends ConsumerWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.watch(registrationTextsProvider);
    return ScrollablePageWithBottomButton(
      appBarData: AppBarData(
        title: texts.title,
      ),
      bottomButton: BottomButton(
        title: texts.bottomButtonTitle,
        onPressed: ref.watch(registrationBottomButtonEnabledProvider)
            ? () => ref
                .read(registrationActionsProvider.notifier)
                .didTapBottomButton()
            : null,
      ),
      children: [
        ..._makeInputs(
          ref,
          texts,
        ),
      ],
    );
  }

  List<Widget> _makeInputs(
    WidgetRef ref,
    RegistrationTexts texts,
  ) {
    return [
      TextFieldInfo(
        texts.emailPlaceholder,
        (val) => ref.read(registrationEmailProvider.notifier).state = val,
      ),
      TextFieldInfo(
        texts.passwordPlaceholder,
        (val) => ref.read(registrationPasswordProvider.notifier).state = val,
        isSecure: true,
      ),
      TextFieldInfo(
        texts.repeatPasswordPlaceholder,
        (val) =>
            ref.read(registrationRepeatedPasswordProvider.notifier).state = val,
        isSecure: true,
      ),
    ].inputs;
  }
}
