import 'package:awe_api/awe_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_provider.dart';

part 'auth_events_provider.g.dart';

@riverpod
AuthEvents authEvents(AuthEventsRef ref) {
  return _AuthEvents(ref);
}

class _AuthEvents extends AuthEvents {
  ProviderRef ref;

  _AuthEvents(
    this.ref,
  );

  @override
  void onLoggedOut() {
    ref.read(authProvider.notifier).forceLogout();
  }
}
