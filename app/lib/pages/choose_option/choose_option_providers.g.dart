// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choose_option_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chooseOptionTextsHash() => r'445e52e0760aae264274cc9aaded9261f42a9dd9';

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

typedef ChooseOptionTextsRef = AutoDisposeProviderRef<ChooseOptionTexts>;

/// See also [chooseOptionTexts].
@ProviderFor(chooseOptionTexts)
const chooseOptionTextsProvider = ChooseOptionTextsFamily();

/// See also [chooseOptionTexts].
class ChooseOptionTextsFamily extends Family<ChooseOptionTexts> {
  /// See also [chooseOptionTexts].
  const ChooseOptionTextsFamily();

  /// See also [chooseOptionTexts].
  ChooseOptionTextsProvider call(
    ChooseOptionType type,
  ) {
    return ChooseOptionTextsProvider(
      type,
    );
  }

  @override
  ChooseOptionTextsProvider getProviderOverride(
    covariant ChooseOptionTextsProvider provider,
  ) {
    return call(
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
  String? get name => r'chooseOptionTextsProvider';
}

/// See also [chooseOptionTexts].
class ChooseOptionTextsProvider extends AutoDisposeProvider<ChooseOptionTexts> {
  /// See also [chooseOptionTexts].
  ChooseOptionTextsProvider(
    this.type,
  ) : super.internal(
          (ref) => chooseOptionTexts(
            ref,
            type,
          ),
          from: chooseOptionTextsProvider,
          name: r'chooseOptionTextsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chooseOptionTextsHash,
          dependencies: ChooseOptionTextsFamily._dependencies,
          allTransitiveDependencies:
              ChooseOptionTextsFamily._allTransitiveDependencies,
        );

  final ChooseOptionType type;

  @override
  bool operator ==(Object other) {
    return other is ChooseOptionTextsProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$chooseOptionItemsHash() => r'cead2afe1f13dc3387d931c2325da9e8e05c2ad7';
typedef ChooseOptionItemsRef
    = AutoDisposeProviderRef<List<ListItemViewModel<dynamic>>>;

/// See also [chooseOptionItems].
@ProviderFor(chooseOptionItems)
const chooseOptionItemsProvider = ChooseOptionItemsFamily();

/// See also [chooseOptionItems].
class ChooseOptionItemsFamily extends Family<List<ListItemViewModel<dynamic>>> {
  /// See also [chooseOptionItems].
  const ChooseOptionItemsFamily();

  /// See also [chooseOptionItems].
  ChooseOptionItemsProvider call(
    ChooseOptionType type,
  ) {
    return ChooseOptionItemsProvider(
      type,
    );
  }

  @override
  ChooseOptionItemsProvider getProviderOverride(
    covariant ChooseOptionItemsProvider provider,
  ) {
    return call(
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
  String? get name => r'chooseOptionItemsProvider';
}

/// See also [chooseOptionItems].
class ChooseOptionItemsProvider
    extends AutoDisposeProvider<List<ListItemViewModel<dynamic>>> {
  /// See also [chooseOptionItems].
  ChooseOptionItemsProvider(
    this.type,
  ) : super.internal(
          (ref) => chooseOptionItems(
            ref,
            type,
          ),
          from: chooseOptionItemsProvider,
          name: r'chooseOptionItemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chooseOptionItemsHash,
          dependencies: ChooseOptionItemsFamily._dependencies,
          allTransitiveDependencies:
              ChooseOptionItemsFamily._allTransitiveDependencies,
        );

  final ChooseOptionType type;

  @override
  bool operator ==(Object other) {
    return other is ChooseOptionItemsProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
