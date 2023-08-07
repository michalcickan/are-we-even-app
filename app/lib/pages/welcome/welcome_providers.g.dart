// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$welcomeTextsHash() => r'9aa965b0eeaaea3b508786e8fb58bae71de558e9';

/// See also [welcomeTexts].
@ProviderFor(welcomeTexts)
final welcomeTextsProvider = AutoDisposeProvider<WelcomeTexts>.internal(
  welcomeTexts,
  name: r'welcomeTextsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$welcomeTextsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WelcomeTextsRef = AutoDisposeProviderRef<WelcomeTexts>;
String _$welcomeItemsHash() => r'89509edd9a63942299d5cce14da7ed239a6c378b';

/// See also [welcomeItems].
@ProviderFor(welcomeItems)
final welcomeItemsProvider = AutoDisposeProvider<List<WelcomeItem>>.internal(
  welcomeItems,
  name: r'welcomeItemsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$welcomeItemsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WelcomeItemsRef = AutoDisposeProviderRef<List<WelcomeItem>>;
String _$welcomeActionsHash() => r'9da08fcdab47b33a75fca8c637ad8cd86ff0ece5';

/// See also [WelcomeActions].
@ProviderFor(WelcomeActions)
final welcomeActionsProvider =
    AutoDisposeNotifierProvider<WelcomeActions, void>.internal(
  WelcomeActions.new,
  name: r'welcomeActionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$welcomeActionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WelcomeActions = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
