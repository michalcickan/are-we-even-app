import 'package:areweeven/widgets/awe_text_field.dart';
import 'package:areweeven/widgets/scrollable_page_with_bottom_button.dart';
import 'package:areweeven/widgets/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'add_address_providers.dart';

class AddAddressPage extends ConsumerWidget {
  const AddAddressPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.read(addAddressTextsProvider);
    return ScrollablePageWithBottomButton(
      title: texts.title,
      bottomButtonTitle: texts.bottomButtonTitle,
      bottomButtonOnPressed: ref.watch(addAddressEnableBottomButtonProvider)
          ? () =>
              ref.read(addAddressActionsProvider.notifier).didTapBottomButton()
          : null,
      children: [
        AWETextField(
          hintText: texts.streetPlaceholder,
          onValueChanged:
              ref.read(addAddressStreetProvider.notifier).updateValue,
        ),
        _spacer,
        AWETextField(
          hintText: texts.countryPlaceholder,
          onValueChanged: ref.read(addAddressCityProvider.notifier).updateValue,
        ),
        _spacer,
        AWETextField(
          hintText: texts.zipPlaceholder,
          onValueChanged: ref.read(addAddressZipProvider.notifier).updateValue,
        ),
        _spacer,
        AWETextField(
          hintText: texts.countryPlaceholder,
          onValueChanged:
              ref.read(addAddressCountryProvider.notifier).updateValue,
        ),
      ],
    );
  }

  Widget get _spacer => const SizedBox(
        height: Sizes.small,
      );
}
