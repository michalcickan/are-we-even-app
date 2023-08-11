import 'package:areweeven/global_providers/device_id_provider.dart';
import 'package:areweeven/global_providers/storage_manager_provider.dart';
import 'package:areweeven/managers/storage_manager.dart';
import 'package:awe_api/awe_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_info_manager_provider.g.dart';

@riverpod
AuthInfoManager authInfoManager(AuthInfoManagerRef ref) {
  return _AuthInfoContainer(
    ref.watch(
      storageManagerProvider,
    ),
    ref.watch(deviceIdProvider.future),
  );
}

class _AuthInfoContainer extends AuthInfoManager {
  IStorageManager storageManager;
  @override
  Future<String> deviceId;

  _AuthInfoContainer(
    this.storageManager,
    this.deviceId,
  );

  @override
  Future<TokensHolder> getTokens() async {
    return TokensHolder(
      await storageManager.read(StoreKey.accessToken),
      await storageManager.read(StoreKey.refreshToken),
    );
  }

  @override
  void saveAccessToken(String? accessToken) {
    _saveOrRemoveToken(
      StoreKey.accessToken,
      accessToken,
    );
  }

  @override
  void saveRefreshToken(String? refreshToken) {
    _saveOrRemoveToken(
      StoreKey.refreshToken,
      refreshToken,
    );
  }

  void _saveOrRemoveToken(StoreKey key, String? token) {
    token != null
        ? storageManager.save(
            key,
            token,
            securely: true,
          )
        : storageManager.remove(
            key,
          );
  }
}
