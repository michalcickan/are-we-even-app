import 'package:areweeven/global_providers/app_startup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'global_providers/go_router_provider.dart';
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
    final router = ref.watch(goRouterProvider);
    return ref.watch(appStartupProvider)
        ? MaterialApp.router(
            routerConfig: router,
          )
        : const MaterialApp(
            home: SplashPage(),
          );
  }
}
