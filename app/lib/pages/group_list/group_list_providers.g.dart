// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_list_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupListTextsHash() => r'7deea463c4bddce2b72326efb97f2e461d127b42';

/// See also [groupListTexts].
@ProviderFor(groupListTexts)
final groupListTextsProvider = AutoDisposeProvider<GroupListTexts>.internal(
  groupListTexts,
  name: r'groupListTextsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupListTextsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GroupListTextsRef = AutoDisposeProviderRef<GroupListTexts>;
String _$groupListActionsHash() => r'ca84ca7645835e0f52cc997f92893bc547b80800';

/// See also [GroupListActions].
@ProviderFor(GroupListActions)
final groupListActionsProvider =
    AutoDisposeNotifierProvider<GroupListActions, void>.internal(
  GroupListActions.new,
  name: r'groupListActionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupListActionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GroupListActions = AutoDisposeNotifier<void>;
String _$groupListSectionsHash() => r'e86cf285a15971d66b092fd6a5ef61458f33059f';

/// See also [GroupListSections].
@ProviderFor(GroupListSections)
final groupListSectionsProvider = AutoDisposeAsyncNotifierProvider<
    GroupListSections, List<ListSection<String>>>.internal(
  GroupListSections.new,
  name: r'groupListSectionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupListSectionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GroupListSections
    = AutoDisposeAsyncNotifier<List<ListSection<String>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
