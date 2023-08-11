// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresses_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addressesTextsHash() => r'06e9b082fd51220de8293d26e3433ef143dd6488';

/// See also [addressesTexts].
@ProviderFor(addressesTexts)
final addressesTextsProvider = AutoDisposeProvider<AddressesTexts>.internal(
  addressesTexts,
  name: r'addressesTextsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addressesTextsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddressesTextsRef = AutoDisposeProviderRef<AddressesTexts>;
String _$addressesHash() => r'7d63e9d46b283f1028fc0d3b4f1f8ccbf5d313d6';

/// See also [addresses].
@ProviderFor(addresses)
final addressesProvider = AutoDisposeProvider<List<Address>>.internal(
  addresses,
  name: r'addressesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$addressesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddressesRef = AutoDisposeProviderRef<List<Address>>;
String _$addressesActionsHash() => r'26758bc6b6420be5ae5980c32cfe07f222fa9258';

/// See also [AddressesActions].
@ProviderFor(AddressesActions)
final addressesActionsProvider =
    AutoDisposeNotifierProvider<AddressesActions, void>.internal(
  AddressesActions.new,
  name: r'addressesActionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addressesActionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddressesActions = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
