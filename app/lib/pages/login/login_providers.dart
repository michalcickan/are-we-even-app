import 'package:areweeven/extensions/go_router_context.dart';
import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:areweeven/global_providers/is_logged_in_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/utils/logger.dart';
import 'package:awe_api/awe_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_providers.g.dart';

class LoginTexts {
  final String title;
  final String? description;
  final String? emailPlaceholder;
  final String? passwordPlaceholder;
  final String bottomButtonTitle;

  LoginTexts({
    required this.title,
    this.description,
    required this.bottomButtonTitle,
    this.passwordPlaceholder,
    this.emailPlaceholder,
  });
}

class LoginInput {
  final String hint;
  final AutoDisposeNotifierProviderImpl<AutoDisposeNotifier<String>, String>
      notifier;
  final bool Function() validate;

  const LoginInput(
    this.hint,
    this.notifier,
    this.validate,
  );
}

@riverpod
LoginTexts loginTexts(LoginTextsRef ref) {
  final translation = ref.watch(localizationProvider);
  return LoginTexts(
    bottomButtonTitle: translation.loginButtonTitle,
    title: translation.loginTitle,
    emailPlaceholder: translation.emailPlaceholder,
    passwordPlaceholder: translation.passwordPlaceholder,
  );
}

@riverpod
class LoginActions extends _$LoginActions with ProviderRouterContextMixin {
  @override
  void build() {}

  Future<void> didTapBottomButton() async {
    try {
      await ref.read(aweApiClientProvider).login(
            LoginParameters(),
            null,
          );
      ref.read(isLoggedInProvider.notifier).setLoggedIn(true);
    } catch (e) {
      logger.e(
        e.toString(),
      );
    }
  }
}

@riverpod
class LoginIsLoading extends _$LoginIsLoading {
  @override
  bool build() {
    return false;
  }
}

@riverpod
class LoginEmail extends _$LoginEmail {
  @override
  String build() {
    return "";
  }
}

@riverpod
class LoginPassword extends _$LoginPassword {
  @override
  String build() {
    return "";
  }
}

@riverpod
bool loginIsButtonEnabled(LoginIsButtonEnabledRef ref) {
  final email = ref.watch(loginEmailProvider);
  final password = ref.watch(loginPasswordProvider);
  return email.length > 3 && password.length > 3;
}
