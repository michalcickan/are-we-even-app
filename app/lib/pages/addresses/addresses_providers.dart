import 'package:areweeven/extensions/go_router_context.dart';
import 'package:areweeven/global_providers/current_user_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/routes/routes.dart';
import 'package:areweeven/routes/settings_routes.dart';
import 'package:awe_api/awe_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'addresses_providers.g.dart';

class AddressesTexts {
  final String title;
  final String emptyText;
  final String bottomButtonTitle;

  AddressesTexts({
    required this.title,
    required this.emptyText,
    required this.bottomButtonTitle,
  });
}

@riverpod
AddressesTexts addressesTexts(AddressesTextsRef ref) {
  final localizations = ref.watch(localizationProvider);
  return AddressesTexts(
    title: localizations.addresses,
    emptyText: localizations.noAddressesText,
    bottomButtonTitle: localizations.add,
  );
}

@riverpod
class AddressesActions extends _$AddressesActions
    with ProviderRouterContextMixin {
  @override
  void build() {}

  Future<void> didTapBottomButton() async {
    final address = await const AddAddressRoute().push(context);
    ref.read(currentUserProvider.notifier).addAddress(address);
  }
}

@riverpod
List<Address> addresses(AddressesRef ref) {
  final addresses = ref.watch(currentUserProvider)?.addresses ?? [];
  return addresses;
}
