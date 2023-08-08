import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:areweeven/global_providers/device_id_provider.dart';
import 'package:areweeven/global_providers/global_error_provider.dart';
import 'package:areweeven/global_providers/token_storage_provider.dart';
import 'package:awe_api/awe_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  FutureOr<bool> build() async {
    final tokens = await ref.read(tokenStorageProvider).getTokens();
    return tokens.accessToken != null;
  }

  void setLoggedIn(bool isLoggedIn) {
    state = AsyncData(isLoggedIn);
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
          await deviceId,
        );
    setLoggedIn(true);
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
          await deviceId,
        );
    setLoggedIn(true);
  }

  Future<void> logout() async {
    try {
      state = const AsyncLoading();
      await ref.read(aweApiClientProvider).logout(await deviceId);
      setLoggedIn(false);
    } catch (e) {
      setLoggedIn(true);
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
          await deviceId,
        );
    setLoggedIn(true);
  }

  Future<String> get deviceId => ref.read(deviceIdProvider.future);
}
