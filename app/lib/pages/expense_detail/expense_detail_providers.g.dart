// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_detail_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$expenseDetailTextsHash() =>
    r'eb291154bca4d860fe4c3ae9e2d5020194245d5c';

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

typedef ExpenseDetailTextsRef = AutoDisposeProviderRef<ExpenseDetailTexts>;

/// See also [expenseDetailTexts].
@ProviderFor(expenseDetailTexts)
const expenseDetailTextsProvider = ExpenseDetailTextsFamily();

/// See also [expenseDetailTexts].
class ExpenseDetailTextsFamily extends Family<ExpenseDetailTexts> {
  /// See also [expenseDetailTexts].
  const ExpenseDetailTextsFamily();

  /// See also [expenseDetailTexts].
  ExpenseDetailTextsProvider call(
    int expenseId,
  ) {
    return ExpenseDetailTextsProvider(
      expenseId,
    );
  }

  @override
  ExpenseDetailTextsProvider getProviderOverride(
    covariant ExpenseDetailTextsProvider provider,
  ) {
    return call(
      provider.expenseId,
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
  String? get name => r'expenseDetailTextsProvider';
}

/// See also [expenseDetailTexts].
class ExpenseDetailTextsProvider
    extends AutoDisposeProvider<ExpenseDetailTexts> {
  /// See also [expenseDetailTexts].
  ExpenseDetailTextsProvider(
    this.expenseId,
  ) : super.internal(
          (ref) => expenseDetailTexts(
            ref,
            expenseId,
          ),
          from: expenseDetailTextsProvider,
          name: r'expenseDetailTextsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$expenseDetailTextsHash,
          dependencies: ExpenseDetailTextsFamily._dependencies,
          allTransitiveDependencies:
              ExpenseDetailTextsFamily._allTransitiveDependencies,
        );

  final int expenseId;

  @override
  bool operator ==(Object other) {
    return other is ExpenseDetailTextsProvider && other.expenseId == expenseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, expenseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$expenseDetailHash() => r'877b8be9243d77c145dd4f3d9a23331d882fd10d';
typedef _ExpenseDetailRef = AutoDisposeFutureProviderRef<Expense>;

/// See also [_expenseDetail].
@ProviderFor(_expenseDetail)
const _expenseDetailProvider = _ExpenseDetailFamily();

/// See also [_expenseDetail].
class _ExpenseDetailFamily extends Family<AsyncValue<Expense>> {
  /// See also [_expenseDetail].
  const _ExpenseDetailFamily();

  /// See also [_expenseDetail].
  _ExpenseDetailProvider call(
    int expenseId,
  ) {
    return _ExpenseDetailProvider(
      expenseId,
    );
  }

  @override
  _ExpenseDetailProvider getProviderOverride(
    covariant _ExpenseDetailProvider provider,
  ) {
    return call(
      provider.expenseId,
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
  String? get name => r'_expenseDetailProvider';
}

/// See also [_expenseDetail].
class _ExpenseDetailProvider extends AutoDisposeFutureProvider<Expense> {
  /// See also [_expenseDetail].
  _ExpenseDetailProvider(
    this.expenseId,
  ) : super.internal(
          (ref) => _expenseDetail(
            ref,
            expenseId,
          ),
          from: _expenseDetailProvider,
          name: r'_expenseDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$expenseDetailHash,
          dependencies: _ExpenseDetailFamily._dependencies,
          allTransitiveDependencies:
              _ExpenseDetailFamily._allTransitiveDependencies,
        );

  final int expenseId;

  @override
  bool operator ==(Object other) {
    return other is _ExpenseDetailProvider && other.expenseId == expenseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, expenseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$expenseDetailBasicInfoHash() =>
    r'e333953f804404fdca0f53e19adf1f0f8ffeca53';
typedef ExpenseDetailBasicInfoRef
    = AutoDisposeProviderRef<ExpenseDetailBasicInfo>;

/// See also [expenseDetailBasicInfo].
@ProviderFor(expenseDetailBasicInfo)
const expenseDetailBasicInfoProvider = ExpenseDetailBasicInfoFamily();

/// See also [expenseDetailBasicInfo].
class ExpenseDetailBasicInfoFamily extends Family<ExpenseDetailBasicInfo> {
  /// See also [expenseDetailBasicInfo].
  const ExpenseDetailBasicInfoFamily();

  /// See also [expenseDetailBasicInfo].
  ExpenseDetailBasicInfoProvider call(
    int expenseId,
  ) {
    return ExpenseDetailBasicInfoProvider(
      expenseId,
    );
  }

  @override
  ExpenseDetailBasicInfoProvider getProviderOverride(
    covariant ExpenseDetailBasicInfoProvider provider,
  ) {
    return call(
      provider.expenseId,
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
  String? get name => r'expenseDetailBasicInfoProvider';
}

/// See also [expenseDetailBasicInfo].
class ExpenseDetailBasicInfoProvider
    extends AutoDisposeProvider<ExpenseDetailBasicInfo> {
  /// See also [expenseDetailBasicInfo].
  ExpenseDetailBasicInfoProvider(
    this.expenseId,
  ) : super.internal(
          (ref) => expenseDetailBasicInfo(
            ref,
            expenseId,
          ),
          from: expenseDetailBasicInfoProvider,
          name: r'expenseDetailBasicInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$expenseDetailBasicInfoHash,
          dependencies: ExpenseDetailBasicInfoFamily._dependencies,
          allTransitiveDependencies:
              ExpenseDetailBasicInfoFamily._allTransitiveDependencies,
        );

  final int expenseId;

  @override
  bool operator ==(Object other) {
    return other is ExpenseDetailBasicInfoProvider &&
        other.expenseId == expenseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, expenseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$expenseDetailChartDataHash() =>
    r'bbd1a0d1a093622c6ef181986a6f0c2c040c0c9e';
typedef ExpenseDetailChartDataRef
    = AutoDisposeFutureProviderRef<Map<String, ChartData>>;

/// See also [expenseDetailChartData].
@ProviderFor(expenseDetailChartData)
const expenseDetailChartDataProvider = ExpenseDetailChartDataFamily();

/// See also [expenseDetailChartData].
class ExpenseDetailChartDataFamily
    extends Family<AsyncValue<Map<String, ChartData>>> {
  /// See also [expenseDetailChartData].
  const ExpenseDetailChartDataFamily();

  /// See also [expenseDetailChartData].
  ExpenseDetailChartDataProvider call(
    int expenseId,
  ) {
    return ExpenseDetailChartDataProvider(
      expenseId,
    );
  }

  @override
  ExpenseDetailChartDataProvider getProviderOverride(
    covariant ExpenseDetailChartDataProvider provider,
  ) {
    return call(
      provider.expenseId,
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
  String? get name => r'expenseDetailChartDataProvider';
}

/// See also [expenseDetailChartData].
class ExpenseDetailChartDataProvider
    extends AutoDisposeFutureProvider<Map<String, ChartData>> {
  /// See also [expenseDetailChartData].
  ExpenseDetailChartDataProvider(
    this.expenseId,
  ) : super.internal(
          (ref) => expenseDetailChartData(
            ref,
            expenseId,
          ),
          from: expenseDetailChartDataProvider,
          name: r'expenseDetailChartDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$expenseDetailChartDataHash,
          dependencies: ExpenseDetailChartDataFamily._dependencies,
          allTransitiveDependencies:
              ExpenseDetailChartDataFamily._allTransitiveDependencies,
        );

  final int expenseId;

  @override
  bool operator ==(Object other) {
    return other is ExpenseDetailChartDataProvider &&
        other.expenseId == expenseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, expenseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$expenseDetailActionsHash() =>
    r'b9d294fa856e2919af53456f69cd18561f4b10d9';

/// See also [ExpenseDetailActions].
@ProviderFor(ExpenseDetailActions)
final expenseDetailActionsProvider =
    AutoDisposeNotifierProvider<ExpenseDetailActions, void>.internal(
  ExpenseDetailActions.new,
  name: r'expenseDetailActionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$expenseDetailActionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ExpenseDetailActions = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
