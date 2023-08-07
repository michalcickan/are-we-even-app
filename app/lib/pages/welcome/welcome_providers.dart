import 'package:areweeven/extensions/go_router_context.dart';
import 'package:areweeven/gen/app_localizations.dart';
import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:areweeven/global_providers/is_logged_in_provider.dart';
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
  final String description;
  final String signUpButtonTitle;

  WelcomeTexts({
    required this.description,
    required this.signUpButtonTitle,
  });
}

@riverpod
WelcomeTexts welcomeTexts(WelcomeTextsRef ref) {
  final translation = ref.watch(localizationProvider);
  return WelcomeTexts(
    description: translation.or,
    signUpButtonTitle: translation.registerButtonWithEmailTitle,
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
          await loginWithExternalProvider(loginType.apiLoginType!);
          ref.read(isLoggedInProvider.notifier).setLoggedIn(true);
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

  Future<AccessToken?> loginWithExternalProvider(LoginType loginType) async {
    final client = OauthService(loginType);
    final token = await client.getIdToken();
    if (token == null) {
      throw Exception("Welcome flow cancelled");
    }
    return await ref.read(aweApiClientProvider).login(
          LoginParameters(
            idToken: token,
          ),
          loginType,
        );
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