import 'package:areweeven/global_providers/auth_provider.dart';
import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:awe_api/awe_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_group_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentGroup extends _$CurrentGroup {
  @override
  Future<Group?> build() {
    return ref.watch(authProvider).when(
          data: (data) => _fetchDefaultGroup(data),
          error: (e, s) => Future.value(null),
          loading: () => Future.value(null),
        );
  }

  Future<Group?> _fetchDefaultGroup(bool logged) {
    return logged
        ? ref.read(aweApiClientProvider).getDefaultGroup()
        : Future.value(null);
  }
}
