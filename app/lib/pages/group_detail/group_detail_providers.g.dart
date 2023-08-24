// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_detail_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupDetailTextsHash() => r'5976960bacada22decf8ace9447b36e68170b705';

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

typedef GroupDetailTextsRef = AutoDisposeProviderRef<GroupDetailTexts>;

/// See also [groupDetailTexts].
@ProviderFor(groupDetailTexts)
const groupDetailTextsProvider = GroupDetailTextsFamily();

/// See also [groupDetailTexts].
class GroupDetailTextsFamily extends Family<GroupDetailTexts> {
  /// See also [groupDetailTexts].
  const GroupDetailTextsFamily();

  /// See also [groupDetailTexts].
  GroupDetailTextsProvider call(
    int groupId,
  ) {
    return GroupDetailTextsProvider(
      groupId,
    );
  }

  @override
  GroupDetailTextsProvider getProviderOverride(
    covariant GroupDetailTextsProvider provider,
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
  String? get name => r'groupDetailTextsProvider';
}

/// See also [groupDetailTexts].
class GroupDetailTextsProvider extends AutoDisposeProvider<GroupDetailTexts> {
  /// See also [groupDetailTexts].
  GroupDetailTextsProvider(
    this.groupId,
  ) : super.internal(
          (ref) => groupDetailTexts(
            ref,
            groupId,
          ),
          from: groupDetailTextsProvider,
          name: r'groupDetailTextsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupDetailTextsHash,
          dependencies: GroupDetailTextsFamily._dependencies,
          allTransitiveDependencies:
              GroupDetailTextsFamily._allTransitiveDependencies,
        );

  final int groupId;

  @override
  bool operator ==(Object other) {
    return other is GroupDetailTextsProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$groupDetailHash() => r'35db78e36e9ce40f96244697439b80d9e2e9ff79';
typedef _GroupDetailRef = AutoDisposeFutureProviderRef<Group>;

/// See also [_groupDetail].
@ProviderFor(_groupDetail)
const _groupDetailProvider = _GroupDetailFamily();

/// See also [_groupDetail].
class _GroupDetailFamily extends Family<AsyncValue<Group>> {
  /// See also [_groupDetail].
  const _GroupDetailFamily();

  /// See also [_groupDetail].
  _GroupDetailProvider call(
    int groupId,
  ) {
    return _GroupDetailProvider(
      groupId,
    );
  }

  @override
  _GroupDetailProvider getProviderOverride(
    covariant _GroupDetailProvider provider,
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
  String? get name => r'_groupDetailProvider';
}

/// See also [_groupDetail].
class _GroupDetailProvider extends AutoDisposeFutureProvider<Group> {
  /// See also [_groupDetail].
  _GroupDetailProvider(
    this.groupId,
  ) : super.internal(
          (ref) => _groupDetail(
            ref,
            groupId,
          ),
          from: _groupDetailProvider,
          name: r'_groupDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupDetailHash,
          dependencies: _GroupDetailFamily._dependencies,
          allTransitiveDependencies:
              _GroupDetailFamily._allTransitiveDependencies,
        );

  final int groupId;

  @override
  bool operator ==(Object other) {
    return other is _GroupDetailProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$groupDetailSectionsHash() =>
    r'c893bf33c483ec1a96d0868c59eb7add19378390';
typedef GroupDetailSectionsRef
    = AutoDisposeFutureProviderRef<List<ListSection<String>>>;

/// See also [groupDetailSections].
@ProviderFor(groupDetailSections)
const groupDetailSectionsProvider = GroupDetailSectionsFamily();

/// See also [groupDetailSections].
class GroupDetailSectionsFamily
    extends Family<AsyncValue<List<ListSection<String>>>> {
  /// See also [groupDetailSections].
  const GroupDetailSectionsFamily();

  /// See also [groupDetailSections].
  GroupDetailSectionsProvider call(
    int groupId,
  ) {
    return GroupDetailSectionsProvider(
      groupId,
    );
  }

  @override
  GroupDetailSectionsProvider getProviderOverride(
    covariant GroupDetailSectionsProvider provider,
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
  String? get name => r'groupDetailSectionsProvider';
}

/// See also [groupDetailSections].
class GroupDetailSectionsProvider
    extends AutoDisposeFutureProvider<List<ListSection<String>>> {
  /// See also [groupDetailSections].
  GroupDetailSectionsProvider(
    this.groupId,
  ) : super.internal(
          (ref) => groupDetailSections(
            ref,
            groupId,
          ),
          from: groupDetailSectionsProvider,
          name: r'groupDetailSectionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupDetailSectionsHash,
          dependencies: GroupDetailSectionsFamily._dependencies,
          allTransitiveDependencies:
              GroupDetailSectionsFamily._allTransitiveDependencies,
        );

  final int groupId;

  @override
  bool operator ==(Object other) {
    return other is GroupDetailSectionsProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$groupDetailShowSwitchToHash() =>
    r'ce1500bed523388c77b919d5049c7f54c0338b07';
typedef GroupDetailShowSwitchToRef = AutoDisposeProviderRef<bool>;

/// See also [groupDetailShowSwitchTo].
@ProviderFor(groupDetailShowSwitchTo)
const groupDetailShowSwitchToProvider = GroupDetailShowSwitchToFamily();

/// See also [groupDetailShowSwitchTo].
class GroupDetailShowSwitchToFamily extends Family<bool> {
  /// See also [groupDetailShowSwitchTo].
  const GroupDetailShowSwitchToFamily();

  /// See also [groupDetailShowSwitchTo].
  GroupDetailShowSwitchToProvider call(
    int groupId,
  ) {
    return GroupDetailShowSwitchToProvider(
      groupId,
    );
  }

  @override
  GroupDetailShowSwitchToProvider getProviderOverride(
    covariant GroupDetailShowSwitchToProvider provider,
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
  String? get name => r'groupDetailShowSwitchToProvider';
}

/// See also [groupDetailShowSwitchTo].
class GroupDetailShowSwitchToProvider extends AutoDisposeProvider<bool> {
  /// See also [groupDetailShowSwitchTo].
  GroupDetailShowSwitchToProvider(
    this.groupId,
  ) : super.internal(
          (ref) => groupDetailShowSwitchTo(
            ref,
            groupId,
          ),
          from: groupDetailShowSwitchToProvider,
          name: r'groupDetailShowSwitchToProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupDetailShowSwitchToHash,
          dependencies: GroupDetailShowSwitchToFamily._dependencies,
          allTransitiveDependencies:
              GroupDetailShowSwitchToFamily._allTransitiveDependencies,
        );

  final int groupId;

  @override
  bool operator ==(Object other) {
    return other is GroupDetailShowSwitchToProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$groupDetailActionsHash() =>
    r'e479bce7bcf7e2458caa93f9d7f683e4b7d50c15';

/// See also [GroupDetailActions].
@ProviderFor(GroupDetailActions)
final groupDetailActionsProvider =
    AutoDisposeNotifierProvider<GroupDetailActions, void>.internal(
  GroupDetailActions.new,
  name: r'groupDetailActionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupDetailActionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GroupDetailActions = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
