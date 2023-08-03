import 'package:areweeven/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'is_logged_in_provider.dart';

part 'go_router_provider.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) => GoRouter(
      routes: $appRoutes,
      redirect: (context, state) {
        switch (state.location) {
          case "/":
            final isLoggedIn = ref.read(isLoggedInProvider).value;
            return isLoggedIn ?? false ? "/login" : "/home";
          default:
            return null;
        }
      },
    );
