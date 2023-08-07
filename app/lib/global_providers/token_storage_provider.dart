import 'package:areweeven/global_providers/storage_manager_provider.dart';
import 'package:areweeven/managers/storage_manager.dart';
import 'package:awe_api/awe_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_storage_provider.g.dart';

@riverpod
TokensStorage tokenStorage(TokenStorageRef ref) {
  return _AppTokensStorage(
    ref.watch(
      storageManagerProvider,
    ),
  );
}

class _AppTokensStorage extends TokensStorage {
  IStorageManager storageManager;

  _AppTokensStorage(
    this.storageManager,
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
