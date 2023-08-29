// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_list_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$expenseListTextsHash() => r'4b128a6c815efe2d0b84f7d54601871701324905';

/// See also [expenseListTexts].
@ProviderFor(expenseListTexts)
final expenseListTextsProvider = AutoDisposeProvider<ExpenseListTexts>.internal(
  expenseListTexts,
  name: r'expenseListTextsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$expenseListTextsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ExpenseListTextsRef = AutoDisposeProviderRef<ExpenseListTexts>;
String _$expenseListActionsHash() =>
    r'66136eea98c053f482b5dc0ed7a335707b126979';

/// See also [ExpenseListActions].
@ProviderFor(ExpenseListActions)
final expenseListActionsProvider =
    AutoDisposeNotifierProvider<ExpenseListActions, void>.internal(
  ExpenseListActions.new,
  name: r'expenseListActionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$expenseListActionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ExpenseListActions = AutoDisposeNotifier<void>;
String _$expenseListItemsHash() => r'0315f70f3c2549584ceaa1af17bc2348bcffaf11';

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

abstract class _$ExpenseListItems extends BuildlessAutoDisposeAsyncNotifier<
    List<ListItemViewModel<dynamic>>> {
  late final int groupId;

  FutureOr<List<ListItemViewModel<dynamic>>> build(
    int groupId,
  );
}

/// See also [ExpenseListItems].
@ProviderFor(ExpenseListItems)
const expenseListItemsProvider = ExpenseListItemsFamily();

/// See also [ExpenseListItems].
class ExpenseListItemsFamily
    extends Family<AsyncValue<List<ListItemViewModel<dynamic>>>> {
  /// See also [ExpenseListItems].
  const ExpenseListItemsFamily();

  /// See also [ExpenseListItems].
  ExpenseListItemsProvider call(
    int groupId,
  ) {
    return ExpenseListItemsProvider(
      groupId,
    );
  }

  @override
  ExpenseListItemsProvider getProviderOverride(
    covariant ExpenseListItemsProvider provider,
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
  String? get name => r'expenseListItemsProvider';
}

/// See also [ExpenseListItems].
class ExpenseListItemsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ExpenseListItems, List<ListItemViewModel<dynamic>>> {
  /// See also [ExpenseListItems].
  ExpenseListItemsProvider(
    this.groupId,
  ) : super.internal(
          () => ExpenseListItems()..groupId = groupId,
          from: expenseListItemsProvider,
          name: r'expenseListItemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$expenseListItemsHash,
          dependencies: ExpenseListItemsFamily._dependencies,
          allTransitiveDependencies:
              ExpenseListItemsFamily._allTransitiveDependencies,
        );

  final int groupId;

  @override
  bool operator ==(Object other) {
    return other is ExpenseListItemsProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<List<ListItemViewModel<dynamic>>> runNotifierBuild(
    covariant ExpenseListItems notifier,
  ) {
    return notifier.build(
      groupId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
