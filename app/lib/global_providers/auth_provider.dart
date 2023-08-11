import 'package:areweeven/global_providers/auth_info_manager_provider.dart';
import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:areweeven/global_providers/global_error_provider.dart';
import 'package:awe_api/awe_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  FutureOr<bool> build() async {
    final tokens = await ref.read(authInfoManagerProvider).getTokens();
    return tokens.accessToken != null;
  }

  Future<void> login(
    String email,
    String password,
  ) async {
    await ref.read(aweApiClientProvider).login(
          LoginParameters(
            email: email,
            password: password,
          ),
          null,
        );
    _setLoggedIn(true);
  }

  Future<void> loginWithExternalProvider(
    String idToken,
    LoginType loginType,
  ) async {
    await ref.read(aweApiClientProvider).login(
          LoginParameters(
            idToken: idToken,
          ),
          loginType,
        );
    _setLoggedIn(true);
  }

  Future<void> logout() async {
    try {
      await ref.read(aweApiClientProvider).logout();
      _setLoggedIn(false);
    } catch (e) {
      ref.read(globalErrorProvider.notifier).showError(e);
    }
  }

  Future<void> register(
    String email,
    String password,
  ) async {
    await ref.read(aweApiClientProvider).register(
          RegistrationParameters(
            password: password,
            email: email,
          ),
        );
    _setLoggedIn(true);
  }

  void forceLogout() {
    _setLoggedIn(false);
  }

  void _setLoggedIn(bool isLoggedIn) {
    state = AsyncData(isLoggedIn);
  }
}
