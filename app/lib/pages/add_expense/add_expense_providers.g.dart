// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_expense_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addExpenseTextsHash() => r'd958f103324540fb48c388ffc75f5150bdb5c863';

/// See also [addExpenseTexts].
@ProviderFor(addExpenseTexts)
final addExpenseTextsProvider = AutoDisposeProvider<AddExpenseTexts>.internal(
  addExpenseTexts,
  name: r'addExpenseTextsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addExpenseTextsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddExpenseTextsRef = AutoDisposeProviderRef<AddExpenseTexts>;
String _$addExpenseBottomButtonEnabledHash() =>
    r'2ce10e40588a289556848bf397c4ae69052b24cd';

/// See also [addExpenseBottomButtonEnabled].
@ProviderFor(addExpenseBottomButtonEnabled)
final addExpenseBottomButtonEnabledProvider =
    AutoDisposeProvider<bool>.internal(
  addExpenseBottomButtonEnabled,
  name: r'addExpenseBottomButtonEnabledProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addExpenseBottomButtonEnabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddExpenseBottomButtonEnabledRef = AutoDisposeProviderRef<bool>;
String _$addExpenseMemberItemsHash() =>
    r'6f325edba9028bc0af844b3730f627edcb0efe2e';

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

typedef AddExpenseMemberItemsRef
    = AutoDisposeFutureProviderRef<List<AddExpenseMemberItem>>;

/// See also [addExpenseMemberItems].
@ProviderFor(addExpenseMemberItems)
const addExpenseMemberItemsProvider = AddExpenseMemberItemsFamily();

/// See also [addExpenseMemberItems].
class AddExpenseMemberItemsFamily
    extends Family<AsyncValue<List<AddExpenseMemberItem>>> {
  /// See also [addExpenseMemberItems].
  const AddExpenseMemberItemsFamily();

  /// See also [addExpenseMemberItems].
  AddExpenseMemberItemsProvider call(
    int groupId,
  ) {
    return AddExpenseMemberItemsProvider(
      groupId,
    );
  }

  @override
  AddExpenseMemberItemsProvider getProviderOverride(
    covariant AddExpenseMemberItemsProvider provider,
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
  String? get name => r'addExpenseMemberItemsProvider';
}

/// See also [addExpenseMemberItems].
class AddExpenseMemberItemsProvider
    extends AutoDisposeFutureProvider<List<AddExpenseMemberItem>> {
  /// See also [addExpenseMemberItems].
  AddExpenseMemberItemsProvider(
    this.groupId,
  ) : super.internal(
          (ref) => addExpenseMemberItems(
            ref,
            groupId,
          ),
          from: addExpenseMemberItemsProvider,
          name: r'addExpenseMemberItemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addExpenseMemberItemsHash,
          dependencies: AddExpenseMemberItemsFamily._dependencies,
          allTransitiveDependencies:
              AddExpenseMemberItemsFamily._allTransitiveDependencies,
        );

  final int groupId;

  @override
  bool operator ==(Object other) {
    return other is AddExpenseMemberItemsProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$addExpenseActionsHash() => r'9dab8355ffbbbf5bce224cd1815aedc6eb8d293f';

/// See also [AddExpenseActions].
@ProviderFor(AddExpenseActions)
final addExpenseActionsProvider =
    AutoDisposeNotifierProvider<AddExpenseActions, void>.internal(
  AddExpenseActions.new,
  name: r'addExpenseActionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addExpenseActionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddExpenseActions = AutoDisposeNotifier<void>;
String _$addExpenseDescriptionHash() =>
    r'310a2720eee91a955bac557b1cead0567e52185d';

/// See also [AddExpenseDescription].
@ProviderFor(AddExpenseDescription)
final addExpenseDescriptionProvider =
    AutoDisposeNotifierProvider<AddExpenseDescription, String>.internal(
  AddExpenseDescription.new,
  name: r'addExpenseDescriptionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addExpenseDescriptionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddExpenseDescription = AutoDisposeNotifier<String>;
String _$addExpensePriceHash() => r'b34cec77e1d76f0c89f4e166e2185c704e9cbfd2';

abstract class _$AddExpensePrice extends BuildlessAutoDisposeNotifier<String> {
  late final int userId;
  late final PriceType type;

  String build(
    int userId,
    PriceType type,
  );
}

/// See also [AddExpensePrice].
@ProviderFor(AddExpensePrice)
const addExpensePriceProvider = AddExpensePriceFamily();

/// See also [AddExpensePrice].
class AddExpensePriceFamily extends Family<String> {
  /// See also [AddExpensePrice].
  const AddExpensePriceFamily();

  /// See also [AddExpensePrice].
  AddExpensePriceProvider call(
    int userId,
    PriceType type,
  ) {
    return AddExpensePriceProvider(
      userId,
      type,
    );
  }

  @override
  AddExpensePriceProvider getProviderOverride(
    covariant AddExpensePriceProvider provider,
  ) {
    return call(
      provider.userId,
      provider.type,
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
  String? get name => r'addExpensePriceProvider';
}

/// See also [AddExpensePrice].
class AddExpensePriceProvider
    extends AutoDisposeNotifierProviderImpl<AddExpensePrice, String> {
  /// See also [AddExpensePrice].
  AddExpensePriceProvider(
    this.userId,
    this.type,
  ) : super.internal(
          () => AddExpensePrice()
            ..userId = userId
            ..type = type,
          from: addExpensePriceProvider,
          name: r'addExpensePriceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addExpensePriceHash,
          dependencies: AddExpensePriceFamily._dependencies,
          allTransitiveDependencies:
              AddExpensePriceFamily._allTransitiveDependencies,
        );

  final int userId;
  final PriceType type;

  @override
  bool operator ==(Object other) {
    return other is AddExpensePriceProvider &&
        other.userId == userId &&
        other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  String runNotifierBuild(
    covariant AddExpensePrice notifier,
  ) {
    return notifier.build(
      userId,
      type,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
