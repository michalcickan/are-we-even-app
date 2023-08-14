// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_list_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupsListTextsHash() => r'bd97b62c28d49172a2081aff4eccba540ecb03b7';

/// See also [groupsListTexts].
@ProviderFor(groupsListTexts)
final groupsListTextsProvider = AutoDisposeProvider<GroupsListTexts>.internal(
  groupsListTexts,
  name: r'groupsListTextsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupsListTextsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GroupsListTextsRef = AutoDisposeProviderRef<GroupsListTexts>;
String _$groupsListItemsHash() => r'f6bb4a4e0454c4e9931e341f31783ddcc4ccee02';

/// See also [groupsListItems].
@ProviderFor(groupsListItems)
final groupsListItemsProvider = AutoDisposeFutureProvider<List<Group>>.internal(
  groupsListItems,
  name: r'groupsListItemsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupsListItemsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GroupsListItemsRef = AutoDisposeFutureProviderRef<List<Group>>;
String _$groupsListActionsHash() => r'b4c0d0b2961e93e5d517da37532bd54c106ef6e6';

/// See also [GroupsListActions].
@ProviderFor(GroupsListActions)
final groupsListActionsProvider =
    AutoDisposeNotifierProvider<GroupsListActions, void>.internal(
  GroupsListActions.new,
  name: r'groupsListActionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupsListActionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GroupsListActions = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
