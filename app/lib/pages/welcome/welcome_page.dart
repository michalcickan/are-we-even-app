import 'package:areweeven/utils/available_login_type.dart';
import 'package:areweeven/widgets/awe_button.dart';
import 'package:areweeven/widgets/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'welcome_providers.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.watch(welcomeTextsProvider);
    return Scaffold(
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...ref
                .watch(welcomeItemsProvider)
                .map(
                  (item) => SignInButton(
                    item.type.buttonStyle,
                    text: item.title,
                    onPressed: () => ref
                        .read(welcomeActionsProvider.notifier)
                        .didTap(item.type),
                  ),
                )
                .toList(),
            const SizedBox(
              height: Sizes.medium,
            ),
            if (texts.loginRegistrationDeliminatorText != null)
              Padding(
                padding: const EdgeInsets.only(
                  top: Sizes.medium,
                ),
                child: Text(
                  texts.loginRegistrationDeliminatorText!,
                ),
              ),
            const SizedBox(
              height: Sizes.medium,
            ),
            AWETextButton(
              TextButtonType.secondary,
              text: texts.signUpButtonTitle,
              onPressed: () =>
                  ref.read(welcomeActionsProvider.notifier).didTapRegister(),
            ),
          ],
        ),
      ),
    );
  }
}

extension _SignInButtonType on AvailableLoginType {
  Buttons get buttonStyle {
    switch (this) {
      case AvailableLoginType.google:
        return Buttons.Google;
      case AvailableLoginType.email:
        return Buttons.Email;
    }
  }
}
