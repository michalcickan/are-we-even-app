// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_group_member_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addGroupMemberTextsHash() =>
    r'7083c3e82871406e1cddab9691adcbd7b7437c56';

/// See also [addGroupMemberTexts].
@ProviderFor(addGroupMemberTexts)
final addGroupMemberTextsProvider =
    AutoDisposeProvider<AddGroupMemberTexts>.internal(
  addGroupMemberTexts,
  name: r'addGroupMemberTextsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addGroupMemberTextsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddGroupMemberTextsRef = AutoDisposeProviderRef<AddGroupMemberTexts>;
String _$addGroupSearchResultsHash() =>
    r'5b31cf3ff73570b2eb0b2613e8c98611239e1e67';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef AddGroupSearchResultsRef
    = AutoDisposeFutureProviderRef<List<ListItemViewModel<dynamic>>>;

/// See also [addGroupSearchResults].
@ProviderFor(addGroupSearchResults)
const addGroupSearchResultsProvider = AddGroupSearchResultsFamily();

/// See also [addGroupSearchResults].
class AddGroupSearchResultsFamily
    extends Family<AsyncValue<List<ListItemViewModel<dynamic>>>> {
  /// See also [addGroupSearchResults].
  const AddGroupSearchResultsFamily();

  /// See also [addGroupSearchResults].
  AddGroupSearchResultsProvider call(
    int groupId,
  ) {
    return AddGroupSearchResultsProvider(
      groupId,
    );
  }

  @override
  AddGroupSearchResultsProvider getProviderOverride(
    covariant AddGroupSearchResultsProvider provider,
  ) {
    return call(
      provider.groupId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'addGroupSearchResultsProvider';
}

/// See also [addGroupSearchResults].
class AddGroupSearchResultsProvider
    extends AutoDisposeFutureProvider<List<ListItemViewModel<dynamic>>> {
  /// See also [addGroupSearchResults].
  AddGroupSearchResultsProvider(
    this.groupId,
  ) : super.internal(
          (ref) => addGroupSearchResults(
            ref,
            groupId,
          ),
          from: addGroupSearchResultsProvider,
          name: r'addGroupSearchResultsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addGroupSearchResultsHash,
          dependencies: AddGroupSearchResultsFamily._dependencies,
          allTransitiveDependencies:
              AddGroupSearchResultsFamily._allTransitiveDependencies,
        );

  final int groupId;

  @override
  bool operator ==(Object other) {
    return other is AddGroupSearchResultsProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$emptyListTextHash() => r'b1864c5388f5fd7c3497d58ac6162af4d2a71cb0';

/// See also [emptyListText].
@ProviderFor(emptyListText)
final emptyListTextProvider = AutoDisposeProvider<String>.internal(
  emptyListText,
  name: r'emptyListTextProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$emptyListTextHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EmptyListTextRef = AutoDisposeProviderRef<String>;
String _$addGroupMemberActionsHash() =>
    r'e8c3142e8c841dbd16880590dff2fa8607119018';

/// See also [AddGroupMemberActions].
@ProviderFor(AddGroupMemberActions)
final addGroupMemberActionsProvider =
    AutoDisposeNotifierProvider<AddGroupMemberActions, void>.internal(
  AddGroupMemberActions.new,
  name: r'addGroupMemberActionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addGroupMemberActionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddGroupMemberActions = AutoDisposeNotifier<void>;
String _$addGroupMemberSearchQueryHash() =>
    r'8e1e5a1f7062f92ff4ae778b4482bb59acdc4feb';

/// See also [AddGroupMemberSearchQuery].
@ProviderFor(AddGroupMemberSearchQuery)
final addGroupMemberSearchQueryProvider =
    AutoDisposeNotifierProvider<AddGroupMemberSearchQuery, String>.internal(
  AddGroupMemberSearchQuery.new,
  name: r'addGroupMemberSearchQueryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addGroupMemberSearchQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddGroupMemberSearchQuery = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
