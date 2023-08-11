// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingsTextsHash() => r'1456dbf89d0a2bfb7b6aa2b7ab9d5cb8f4282c24';

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

typedef SettingsTextsRef = AutoDisposeProviderRef<SettingsTexts>;

/// See also [settingsTexts].
@ProviderFor(settingsTexts)
const settingsTextsProvider = SettingsTextsFamily();

/// See also [settingsTexts].
class SettingsTextsFamily extends Family<SettingsTexts> {
  /// See also [settingsTexts].
  const SettingsTextsFamily();

  /// See also [settingsTexts].
  SettingsTextsProvider call(
    SettingsSection section,
  ) {
    return SettingsTextsProvider(
      section,
    );
  }

  @override
  SettingsTextsProvider getProviderOverride(
    covariant SettingsTextsProvider provider,
  ) {
    return call(
      provider.section,
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
  String? get name => r'settingsTextsProvider';
}

/// See also [settingsTexts].
class SettingsTextsProvider extends AutoDisposeProvider<SettingsTexts> {
  /// See also [settingsTexts].
  SettingsTextsProvider(
    this.section,
  ) : super.internal(
          (ref) => settingsTexts(
            ref,
            section,
          ),
          from: settingsTextsProvider,
          name: r'settingsTextsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$settingsTextsHash,
          dependencies: SettingsTextsFamily._dependencies,
          allTransitiveDependencies:
              SettingsTextsFamily._allTransitiveDependencies,
        );

  final SettingsSection section;

  @override
  bool operator ==(Object other) {
    return other is SettingsTextsProvider && other.section == section;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, section.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$settingListItemsHash() => r'6b440fd7d04af7f11ee8bdff0106b95fbc764d27';
typedef SettingListItemsRef = AutoDisposeProviderRef<List<SettingListItem>>;

/// See also [settingListItems].
@ProviderFor(settingListItems)
const settingListItemsProvider = SettingListItemsFamily();

/// See also [settingListItems].
class SettingListItemsFamily extends Family<List<SettingListItem>> {
  /// See also [settingListItems].
  const SettingListItemsFamily();

  /// See also [settingListItems].
  SettingListItemsProvider call(
    SettingsSection section,
  ) {
    return SettingListItemsProvider(
      section,
    );
  }

  @override
  SettingListItemsProvider getProviderOverride(
    covariant SettingListItemsProvider provider,
  ) {
    return call(
      provider.section,
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
  String? get name => r'settingListItemsProvider';
}

/// See also [settingListItems].
class SettingListItemsProvider
    extends AutoDisposeProvider<List<SettingListItem>> {
  /// See also [settingListItems].
  SettingListItemsProvider(
    this.section,
  ) : super.internal(
          (ref) => settingListItems(
            ref,
            section,
          ),
          from: settingListItemsProvider,
          name: r'settingListItemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$settingListItemsHash,
          dependencies: SettingListItemsFamily._dependencies,
          allTransitiveDependencies:
              SettingListItemsFamily._allTransitiveDependencies,
        );

  final SettingsSection section;

  @override
  bool operator ==(Object other) {
    return other is SettingListItemsProvider && other.section == section;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, section.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$settingsActionsHash() => r'8bdc411d23ccf1ea958ae7173931d7ebed7501d3';

/// See also [SettingsActions].
@ProviderFor(SettingsActions)
final settingsActionsProvider =
    AutoDisposeNotifierProvider<SettingsActions, void>.internal(
  SettingsActions.new,
  name: r'settingsActionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingsActionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SettingsActions = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
