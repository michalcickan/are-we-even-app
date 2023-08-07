import 'package:areweeven/global_providers/go_router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin AsyncProviderRouterContextMixin<T> on AutoDisposeAsyncNotifier<T> {
  BuildContext get context =>
      ref.read(goRouterProvider).routerDelegate.navigatorKey.currentContext!;
}

mixin ProviderRouterContextMixin<T> on AutoDisposeNotifier<T> {
  BuildContext get context =>
      ref.read(goRouterProvider).routerDelegate.navigatorKey.currentContext!;
}
