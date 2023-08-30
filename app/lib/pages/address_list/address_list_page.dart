import 'package:areweeven/widgets/list_item_builders/list_item_builder.dart';
import 'package:areweeven/widgets/page_scaffold.dart';
import 'package:awe_api/awe_api.dart';
import 'package:awe_widgets/awe_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'address_list_providers.dart';

class AddressListPage extends ConsumerWidget {
  const AddressListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.watch(addressListTextsProvider);
    final addressList = ref.watch(addressListProvider);
    return PageScaffold(
      appBarData: AppBarData(
        title: texts.title,
      ),
      floatingButton: FloatingButton(
        iconData: Icons.add,
        onPressed: () =>
            ref.read(addressListActionsProvider.notifier).didTapBottomButton(),
      ),
      body: AWEListView(
        ListViewType.defaultIndentation,
        listViewItemsBuilder: AppListItemsBuilder(
          addressList.length,
          (context, index) => _makeItem(
            context,
            addressList[index],
          ),
        ),
        emptyText: texts.emptyText,
      ),
    );
  }

  Widget _makeItem(BuildContext context, Address address) => AWECard(
        CardType.defaultIndentation,
        child: Column(
          children: [
            Text(address.city),
            _itemSpace,
            Text(address.street),
            _itemSpace,
            Text(address.zip),
            _itemSpace,
            Text(address.country),
          ],
        ),
      );

  Widget get _itemSpace => const SizedBox(
        height: AWESizes.small,
      );
}
