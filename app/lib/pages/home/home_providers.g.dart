// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeTextsHash() => r'94ece04c6c6925ca7e647edeacf54b9e1dd34d9c';

/// See also [homeTexts].
@ProviderFor(homeTexts)
final homeTextsProvider = AutoDisposeProvider<HomeTexts>.internal(
  homeTexts,
  name: r'homeTextsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$homeTextsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HomeTextsRef = AutoDisposeProviderRef<HomeTexts>;
String _$homeSectionsHash() => r'a29969ae33f683e48b075b2f42f5d61bad9e75ff';

/// See also [homeSections].
@ProviderFor(homeSections)
final homeSectionsProvider =
    AutoDisposeFutureProvider<List<ListSection<String>>>.internal(
  homeSections,
  name: r'homeSectionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$homeSectionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HomeSectionsRef
    = AutoDisposeFutureProviderRef<List<ListSection<String>>>;
String _$homeActionsHash() => r'23ba18f7c94f298179b48174d37cfe33731d0cd6';

/// See also [HomeActions].
@ProviderFor(HomeActions)
final homeActionsProvider =
    AutoDisposeNotifierProvider<HomeActions, void>.internal(
  HomeActions.new,
  name: r'homeActionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$homeActionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomeActions = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
