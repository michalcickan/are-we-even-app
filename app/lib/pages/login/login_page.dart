import 'package:areweeven/pages/login/login_providers.dart';
import 'package:areweeven/widgets/awe_text_field.dart';
import 'package:areweeven/widgets/scrollable_page_with_bottom_button.dart';
import 'package:areweeven/widgets/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.watch(loginTextsProvider);
    return ScrollablePageWithBottomButton(
      title: texts.title,
      bottomButtonTitle: texts.bottomButtonTitle,
      bottomButtonOnPressed: ref.watch(loginIsButtonEnabledProvider)
          ? () => ref.read(loginActionsProvider.notifier).didTapBottomButton()
          : null,
      children: [
        if (texts.description != null)
          Text(
            texts.description!,
          ),
        ..._makeInputs(
          ref,
          texts,
        ),
      ],
    );
  }

  List<Widget> _makeInputs(
    WidgetRef ref,
    LoginTexts texts,
  ) {
    return [
      _TextFieldInfo(
        texts.emailPlaceholder,
        (val) => ref.read(loginEmailProvider.notifier).state = val,
      ),
      _TextFieldInfo(
        texts.passwordPlaceholder,
        (val) => ref.read(loginPasswordProvider.notifier).state = val,
        isSecure: true,
      )
    ]
        .expand(
          (e) => [
            AWETextField(
              hintText: e.hint,
              onValueChanged: e.onChangeValue,
              obscureText: e.isSecure,
            ),
            const SizedBox(
              height: Sizes.small,
            ),
          ],
        )
        .toList();
  }
}

class _TextFieldInfo {
  final String? hint;
  final void Function(String) onChangeValue;
  final bool isSecure;

  _TextFieldInfo(
    this.hint,
    this.onChangeValue, {
    this.isSecure = false,
  });
}
