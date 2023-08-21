import 'package:areweeven/global_providers/current_user_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/routes/routes.dart';
import 'package:areweeven/routes/settings_routes.dart';
import 'package:areweeven/utils/extensions/go_router_context.dart';
import 'package:awe_api/awe_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'address_list_providers.g.dart';

class AddressListTexts {
  final String title;
  final String emptyText;
  final String bottomButtonTitle;

  AddressListTexts({
    required this.title,
    required this.emptyText,
    required this.bottomButtonTitle,
  });
}

@riverpod
AddressListTexts addressListTexts(AddressListTextsRef ref) {
  final localizations = ref.watch(localizationProvider);
  return AddressListTexts(
    title: localizations.addresses,
    emptyText: localizations.noAddressText,
    bottomButtonTitle: localizations.add,
  );
}

@riverpod
class AddressListActions extends _$AddressListActions
    with ProviderRouterContextMixin {
  @override
  void build() {}

  Future<void> didTapBottomButton() async {
    final address = await const AddAddressRoute().push(context);
    if (address == null) return;
    ref.read(currentUserProvider.notifier).addAddress(address);
  }
}

@riverpod
List<Address> addressList(AddressListRef ref) {
  final addressList = ref.watch(currentUserProvider)?.addresses ?? [];
  return addressList;
}
