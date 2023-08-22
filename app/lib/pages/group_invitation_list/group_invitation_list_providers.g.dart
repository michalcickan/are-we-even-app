// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_invitation_list_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupInvitationListTextsHash() =>
    r'3e9cd1430a6f3ec866230d494ee3ae496c07a6f2';

/// See also [groupInvitationListTexts].
@ProviderFor(groupInvitationListTexts)
final groupInvitationListTextsProvider =
    AutoDisposeProvider<GroupInvitationListTexts>.internal(
  groupInvitationListTexts,
  name: r'groupInvitationListTextsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupInvitationListTextsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GroupInvitationListTextsRef
    = AutoDisposeProviderRef<GroupInvitationListTexts>;
String _$groupInvitationListItemsHash() =>
    r'6543107299f0744bcea994bc53e9ce7821f80a66';

/// See also [groupInvitationListItems].
@ProviderFor(groupInvitationListItems)
final groupInvitationListItemsProvider =
    AutoDisposeFutureProvider<List<ListItemViewModel<int>>>.internal(
  groupInvitationListItems,
  name: r'groupInvitationListItemsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupInvitationListItemsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GroupInvitationListItemsRef
    = AutoDisposeFutureProviderRef<List<ListItemViewModel<int>>>;
String _$groupInvitationListActionsHash() =>
    r'064bcd84ea48e3fe881c605dabb69329f357549e';

/// See also [GroupInvitationListActions].
@ProviderFor(GroupInvitationListActions)
final groupInvitationListActionsProvider =
    AutoDisposeNotifierProvider<GroupInvitationListActions, void>.internal(
  GroupInvitationListActions.new,
  name: r'groupInvitationListActionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupInvitationListActionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GroupInvitationListActions = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
