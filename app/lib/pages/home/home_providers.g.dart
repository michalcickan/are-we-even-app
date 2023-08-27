// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeTextsHash() => r'd2229cc56b0421226da934f7464f6b6235429bc4';

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
String _$homeSectionsHash() => r'8ca0ecefa7f762addfeb93353d07194c40cd5a31';

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
String _$homeActionsHash() => r'970cffa104c8308814404a5b4e1fd8c00955afda';

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
