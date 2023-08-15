// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_list_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addressListTextsHash() => r'72f0c9c4897ec4224ecdfdc719376ac880b20b0f';

/// See also [addressListTexts].
@ProviderFor(addressListTexts)
final addressListTextsProvider = AutoDisposeProvider<AddressListTexts>.internal(
  addressListTexts,
  name: r'addressListTextsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addressListTextsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddressListTextsRef = AutoDisposeProviderRef<AddressListTexts>;
String _$addressListHash() => r'605b34d5594ba7ede72c37df9ee3c5fe1a6b4109';

/// See also [addressList].
@ProviderFor(addressList)
final addressListProvider = AutoDisposeProvider<List<Address>>.internal(
  addressList,
  name: r'addressListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$addressListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddressListRef = AutoDisposeProviderRef<List<Address>>;
String _$addressListActionsHash() =>
    r'b1c371ab527254e9c9fa3d0d2aec48c49e2bf4d0';

/// See also [AddressListActions].
@ProviderFor(AddressListActions)
final addressListActionsProvider =
    AutoDisposeNotifierProvider<AddressListActions, void>.internal(
  AddressListActions.new,
  name: r'addressListActionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addressListActionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddressListActions = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
