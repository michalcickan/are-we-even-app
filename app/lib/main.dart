import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'global_providers/go_router_provider.dart';
import 'global_providers/is_logged_in_provider.dart';
import 'pages/splash_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final goRouter = ref.watch(goRouterProvider);
    return ref.watch(isLoggedInProvider).maybeWhen(
          orElse: () => MaterialApp.router(
            title: 'Material App',
            routerConfig: goRouter,
          ),
          loading: () => const MaterialApp(
            home: SplashPage(),
          ),
        );
  }
}
