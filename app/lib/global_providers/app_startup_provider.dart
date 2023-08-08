import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_provider.dart';
import 'device_id_provider.dart';

part 'app_startup_provider.g.dart';

@riverpod
bool appStartup(AppStartupRef ref) {
  final authInitialized = ref.watch(authProvider).maybeWhen(
        data: (_) => true,
        orElse: () => false,
      );
  final infoInitialized = ref.watch(deviceIdProvider).maybeWhen(
        data: (_) => true,
        orElse: () => false,
      );
  return authInitialized && infoInitialized;
}
