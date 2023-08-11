import 'package:areweeven/global_providers/auth_provider.dart';
import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:awe_api/awe_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentUser extends _$CurrentUser {
  @override
  User? build() {
    ref.listen(authProvider, (previous, next) async {
      if (previous == next) return;
      state = next.value == true
          ? await ref.read(aweApiClientProvider).getUser()
          : null;
    });
    return null;
  }

  void setUser(User user) async {
    state = user;
  }

  void clearUser() {
    state = null;
  }
}
