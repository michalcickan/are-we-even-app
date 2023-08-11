import 'package:areweeven/extensions/build_context_themes.dart';
import 'package:areweeven/widgets/scrollable_page_with_bottom_button.dart';
import 'package:areweeven/widgets/sizes.dart';
import 'package:awe_api/awe_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'addresses_providers.dart';

class AddressesPage extends ConsumerWidget {
  const AddressesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.read(addressesTextsProvider);
    final addresses = ref.watch(addressesProvider);
    return ScrollablePageWithBottomButton(
      title: texts.title,
      bottomButtonTitle: texts.bottomButtonTitle,
      bottomButtonOnPressed: () {
        ref.read(addressesActionsProvider.notifier).didTapBottomButton();
      },
      children: addresses.isEmpty
          ? [
              Center(
                child: Text(texts.emptyText),
              ),
            ]
          : addresses
              .map(
                _makeItem(context),
              )
              .toList(),
    );
  }

  Widget Function(Address) _makeItem(BuildContext context) =>
      (Address address) => Container(
            color: context.colorScheme.surface,
            padding: const EdgeInsets.all(
              Sizes.medium,
            ),
            margin: const EdgeInsets.only(bottom: Sizes.small),
            child: Column(
              children: [
                Text(address.city),
                _itemSpace,
                Text(address.street),
                _itemSpace,
                Text(address.zip),
              ],
            ),
          );

  Widget get _itemSpace => const SizedBox(
        height: Sizes.small,
      );
}
