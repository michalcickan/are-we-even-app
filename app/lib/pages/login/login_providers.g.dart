// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginTextsHash() => r'743ca43300547ee8674db87e2cf273855936a2f1';

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
String _$loginIsButtonEnabledHash() =>
    r'094976b3c8572c44ba04bf4bf69819a2f065315c';

/// See also [loginIsButtonEnabled].
@ProviderFor(loginIsButtonEnabled)
final loginIsButtonEnabledProvider = AutoDisposeProvider<bool>.internal(
  loginIsButtonEnabled,
  name: r'loginIsButtonEnabledProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loginIsButtonEnabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoginIsButtonEnabledRef = AutoDisposeProviderRef<bool>;
String _$loginActionsHash() => r'1ab540c4db9a6434d1442406a526d270b8044936';

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
String _$loginIsLoadingHash() => r'006e5b55f3a90d904dda038f51445259e0346f5a';

/// See also [LoginIsLoading].
@ProviderFor(LoginIsLoading)
final loginIsLoadingProvider =
    AutoDisposeNotifierProvider<LoginIsLoading, bool>.internal(
  LoginIsLoading.new,
  name: r'loginIsLoadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loginIsLoadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoginIsLoading = AutoDisposeNotifier<bool>;
String _$loginEmailHash() => r'3bc97709eb2123966571457031d05d4678c1d2ac';

/// See also [LoginEmail].
@ProviderFor(LoginEmail)
final loginEmailProvider =
    AutoDisposeNotifierProvider<LoginEmail, String>.internal(
  LoginEmail.new,
  name: r'loginEmailProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginEmailHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoginEmail = AutoDisposeNotifier<String>;
String _$loginPasswordHash() => r'b967afae1163178a6fee737103744417e6c63a38';

/// See also [LoginPassword].
@ProviderFor(LoginPassword)
final loginPasswordProvider =
    AutoDisposeNotifierProvider<LoginPassword, String>.internal(
  LoginPassword.new,
  name: r'loginPasswordProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loginPasswordHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoginPassword = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
