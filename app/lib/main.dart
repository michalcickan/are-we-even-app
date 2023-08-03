import 'package:areweeven/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'global_providers/go_router_provider.dart';
import 'global_providers/is_logged_in_provider.dart';

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
    return ref.watch(isLoggedInProvider).when(
          data: (data) => MaterialApp.router(
            title: 'Material App',
            routerConfig: goRouter,
          ),
          error: (error, stackTrace) => MaterialApp.router(
            title: 'Material App',
            routerConfig: goRouter,
          ),
          loading: () => HomePage(),
        );
  }
}
