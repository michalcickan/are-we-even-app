import 'package:areweeven/pages/login/login_providers.dart';
import 'package:areweeven/utils/text_field_info.dart';
import 'package:areweeven/widgets/page_scaffold.dart';
import 'package:areweeven/widgets/scrollable_page_with_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.watch(loginTextsProvider);
    return ScrollablePageWithBottomButton(
      appBarData: AppBarData(
        title: texts.title,
      ),
      bottomButton: BottomButton(
        title: texts.bottomButtonTitle,
        onPressed: ref.watch(loginIsButtonEnabledProvider)
            ? () => ref.read(loginActionsProvider.notifier).didTapBottomButton()
            : null,
      ),
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
      TextFieldInfo(
        texts.emailPlaceholder,
        (val) => ref.read(loginEmailProvider.notifier).state = val,
      ),
      TextFieldInfo(
        texts.passwordPlaceholder,
        (val) => ref.read(loginPasswordProvider.notifier).state = val,
        isSecure: true,
      )
    ].inputs;
  }
}
