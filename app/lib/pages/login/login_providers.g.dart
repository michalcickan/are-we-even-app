// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginTextsHash() => r'dd08040ef9aa4d3b5567661276304c7e7092ff91';

/// See also [loginTexts].
@ProviderFor(loginTexts)
final loginTextsProvider = AutoDisposeProvider<LoginTexts>.internal(
  loginTexts,
  name: r'loginTextsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginTextsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoginTextsRef = AutoDisposeProviderRef<LoginTexts>;
String _$loginActionsHash() => r'c5e861b1812a06f7ad806fd6e63ab1f5a3bd000c';

/// See also [LoginActions].
@ProviderFor(LoginActions)
final loginActionsProvider =
    AutoDisposeNotifierProvider<LoginActions, void>.internal(
  LoginActions.new,
  name: r'loginActionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginActionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoginActions = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
