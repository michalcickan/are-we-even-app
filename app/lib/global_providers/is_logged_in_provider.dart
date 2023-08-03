import 'package:areweeven/global_providers/token_storage_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_logged_in_provider.g.dart';

@riverpod
class IsLoggedIn extends _$IsLoggedIn {
  @override
  FutureOr<bool> build() async {
    final tokens = await ref.read(tokenStorageProvider).getTokens();
    return tokens.accessToken != null;
  }

  void setLoggedIn(bool isLoggedIn) {
    state = const AsyncValue.data(false);
  }
}
