import 'package:areweeven/utils/extensions/go_router_context.dart';
import 'package:areweeven/gen/app_localizations.dart';
import 'package:areweeven/global_providers/auth_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/routes/auth_routes.dart';
import 'package:areweeven/routes/routes.dart';
import 'package:areweeven/services/authentication-service.dart';
import 'package:areweeven/utils/available_login_type.dart';
import 'package:areweeven/utils/logger.dart';
import 'package:awe_api/awe_api.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'welcome_providers.g.dart';

class WelcomeItem {
  String title;
  AvailableLoginType type;

  WelcomeItem(
    this.title,
    this.type,
  );
}

class WelcomeTexts {
  final String? loginRegistrationDeliminatorText;
  final String signUpButtonTitle;

  WelcomeTexts({
    required this.signUpButtonTitle,
    this.loginRegistrationDeliminatorText,
  });
}

@riverpod
WelcomeTexts welcomeTexts(WelcomeTextsRef ref) {
  final localizations = ref.watch(localizationProvider);
  return WelcomeTexts(
    loginRegistrationDeliminatorText: "------- ${localizations.or} -------",
    signUpButtonTitle: localizations.registerButtonWithEmailTitle,
  );
}

@riverpod
class WelcomeActions extends _$WelcomeActions with ProviderRouterContextMixin {
  @override
  void build() {}

  Future<void> didTap(AvailableLoginType loginType) async {
    switch (loginType) {
      case AvailableLoginType.email:
        const LoginRoute().push(context);
        break;
      case AvailableLoginType.google:
        try {
          final apiLoginType = loginType.apiLoginType!;
          final client = OauthService(apiLoginType);
          final token = await client.getIdToken();
          if (token == null) {
            throw Exception("Welcome flow cancelled");
          }
          await ref.read(authProvider.notifier).loginWithExternalProvider(
                token,
                apiLoginType,
              );
        } on APIError catch (e) {
          // showError
          if (kDebugMode) {
            logger.e(e);
          }
        } catch (e) {
          // do nothing. User just cancelled
          logger.i(e.toString());
        }
    }
  }

  Future<void> didTapRegister() async {
    const RegistrationRoute().push(context);
  }
}

@riverpod
List<WelcomeItem> welcomeItems(WelcomeItemsRef ref) {
  final localizations = ref.watch(localizationProvider);
  return AvailableLoginType.values
      .map((loginType) => WelcomeItem(
            loginType.title(
              localizations,
            ),
            loginType,
          ))
      .toList();
}

extension _WelcomeType on AvailableLoginType {
  LoginType? get apiLoginType {
    switch (this) {
      case AvailableLoginType.google:
        return LoginType.google;
    }
  }

  String title(AppLocalizations localizations) {
    switch (this) {
      case AvailableLoginType.google:
        return localizations.loginButtonWithGoogleTitle;
      case AvailableLoginType.email:
        return localizations.loginButtonWithEmailTitle;
    }
  }
}
