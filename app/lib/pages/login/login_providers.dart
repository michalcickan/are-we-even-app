import 'package:areweeven/extensions/go_router_context.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_providers.g.dart';

class LoginTexts {
  final String title;
  final String? description;
  final String bottomButtonTitle;

  LoginTexts({
    required this.title,
    this.description,
    required this.bottomButtonTitle,
  });
}

@riverpod
LoginTexts loginTexts(LoginTextsRef ref) {
  final translation = ref.watch(localizationProvider);
  return LoginTexts(
    bottomButtonTitle: translation.loginButtonTitle,
    title: translation.loginTitle,
  );
}

@riverpod
class LoginActions extends _$LoginActions with ProviderRouterContextMixin {
  void build() {}

  void didTapBottomButton() {
    return;
  }
}
