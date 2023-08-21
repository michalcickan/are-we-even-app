import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:areweeven/global_providers/global_error_provider.dart';
import 'package:areweeven/global_providers/go_router_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/utils/extensions/go_router_context.dart';
import 'package:areweeven/utils/update_value_mixin.dart';
import 'package:awe_api/awe_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_address_providers.g.dart';

class AddAddressTexts {
  final String title;
  final String? zipPlaceholder;
  final String? streetPlaceholder;
  final String? countryPlaceholder;
  final String bottomButtonTitle;

  AddAddressTexts({
    required this.title,
    this.zipPlaceholder,
    this.streetPlaceholder,
    this.countryPlaceholder,
    required this.bottomButtonTitle,
  });
}

@riverpod
AddAddressTexts addAddressTexts(AddAddressTextsRef ref) {
  final localizations = ref.watch(localizationProvider);
  return AddAddressTexts(
    title: localizations.addAddressTitle,
    bottomButtonTitle: localizations.save,
    zipPlaceholder: localizations.zip,
    countryPlaceholder: localizations.country,
    streetPlaceholder: localizations.street,
  );
}

@riverpod
class AddAddressActions extends _$AddAddressActions
    with ProviderRouterContextMixin {
  @override
  void build() {}

  Future<void> didTapBottomButton() async {
    try {
      final address = await ref.read(aweApiClientProvider).addAddress(
            CreateUserAddressParameters(
              city: ref.read(addAddressCityProvider),
              country: ref.read(addAddressCountryProvider),
              zip: ref.read(addAddressZipProvider),
              street: ref.read(addAddressStreetProvider),
            ),
          );
      ref.read(goRouterProvider).pop(address);
    } catch (e) {
      ref.read(globalErrorProvider.notifier).showError(e);
    }
  }
}

@riverpod
class AddAddressZip extends _$AddAddressZip with UpdateValue {
  @override
  String build() {
    return "";
  }
}

@riverpod
class AddAddressStreet extends _$AddAddressStreet with UpdateValue {
  @override
  String build() {
    return "";
  }
}

@riverpod
class AddAddressCity extends _$AddAddressCity with UpdateValue {
  @override
  String build() {
    return "";
  }
}

@riverpod
class AddAddressCountry extends _$AddAddressStreet with UpdateValue {
  @override
  String build() {
    return "";
  }
}

@riverpod
bool addAddressEnableBottomButton(AddAddressEnableBottomButtonRef ref) {
  final providers = [
    ref.watch(addAddressStreetProvider),
    ref.watch(addAddressCountryProvider),
    ref.watch(addAddressZipProvider),
    ref.watch(addAddressCityProvider),
  ];
  return providers.every((element) => element.length > 3);
}
