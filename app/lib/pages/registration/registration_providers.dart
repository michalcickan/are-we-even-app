import 'package:areweeven/exceptions/validation_exception.dart';
import 'package:areweeven/global_providers/auth_provider.dart';
import 'package:areweeven/global_providers/global_error_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/utils/extensions/go_router_context.dart';
import 'package:email_validator/email_validator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'registration_providers.g.dart';

class RegistrationTexts {
  final String title;
  final String? emailPlaceholder;
  final String? passwordPlaceholder;
  final String? repeatPasswordPlaceholder;
  final String? description;
  final String bottomButtonTitle;

  RegistrationTexts({
    required this.title,
    this.description,
    this.passwordPlaceholder,
    this.repeatPasswordPlaceholder,
    this.emailPlaceholder,
    required this.bottomButtonTitle,
  });
}

@riverpod
RegistrationTexts registrationTexts(RegistrationTextsRef ref) {
  final localizations = ref.watch(localizationProvider);
  return RegistrationTexts(
    title: localizations.registrationTitle,
    bottomButtonTitle: localizations.registerButtonWithEmailTitle,
    emailPlaceholder: localizations.emailHint,
    passwordPlaceholder: localizations.passwordHint,
    repeatPasswordPlaceholder: localizations.repeatPasswordHint,
  );
}

@riverpod
class RegistrationActions extends _$RegistrationActions
    with ProviderRouterContextMixin {
  @override
  void build() {}

  Future<void> didTapBottomButton() async {
    try {
      final email = ref.read(registrationEmailProvider);
      if (!EmailValidator.validate(email)) {
        throw ValidationException.incorrectEmailFormat();
      }
      final password = ref.read(registrationPasswordProvider);
      final repeatedPassword = ref.read(registrationRepeatedPasswordProvider);
      if (password != repeatedPassword) {
        throw ValidationException.passwordNotMatch();
      }
      await ref.read(authProvider.notifier).register(
            email,
            password,
          );
    } catch (e) {
      ref.read(globalErrorProvider.notifier).showError(e);
    }
  }
}

@riverpod
class RegistrationEmail extends _$RegistrationEmail {
  @override
  String build() {
    return "";
  }
}

@riverpod
class RegistrationPassword extends _$RegistrationPassword {
  @override
  String build() {
    return "";
  }
}

@riverpod
class RegistrationRepeatedPassword extends _$RegistrationRepeatedPassword {
  @override
  String build() {
    return "";
  }
}

@riverpod
bool registrationBottomButtonEnabled(RegistrationBottomButtonEnabledRef ref) {
  final email = ref.watch(registrationEmailProvider);
  final password = ref.watch(registrationPasswordProvider);
  final repeatedPassword = ref.watch(registrationRepeatedPasswordProvider);
  return [email, password, repeatedPassword].every(
    (element) => element.length > 3,
  );
}
