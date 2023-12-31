import 'package:areweeven/routes/routes.dart';
import 'package:areweeven/routes/routes_global_keys.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_provider.dart';

part 'go_router_provider.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final isLoggedIn = ref.watch(authProvider);
  return GoRouter(
    routes: $appRoutes,
    navigatorKey: rootNavigatorKey,
    redirect: (context, state) {
      switch (state.uri.toString()) {
        case "/":
          return isLoggedIn.value ?? false ? "/home" : "/welcome";
        default:
          return null;
      }
    },
  );
}
