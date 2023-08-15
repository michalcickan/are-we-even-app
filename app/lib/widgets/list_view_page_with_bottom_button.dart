import 'package:areweeven/widgets/awe_button.dart';
import 'package:areweeven/widgets/awe_list_view.dart';
import 'package:areweeven/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListViewPageWithBottomButton extends ConsumerWidget {
  /// Title below progress bar, not app bar title
  final String? title;

  /// Title for the bottom button
  final String bottomButtonTitle;
  final VoidCallback? onBottomButtonPressed;
  final NullableIndexedWidgetBuilder itemBuilder;
  final int itemsCount;

  const ListViewPageWithBottomButton({
    this.title,
    required this.bottomButtonTitle,
    this.onBottomButtonPressed,
    required this.itemBuilder,
    required this.itemsCount,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageScaffold(
      title: title,
      body: Column(
        children: [
          Expanded(
            child: AWEListView(
              ListViewType.defaultIndentation,
              itemsCount: itemsCount,
              itemBuilder: itemBuilder,
            ),
          ),
          AWETextButton(
            TextButtonType.primary,
            text: bottomButtonTitle,
            onPressed: onBottomButtonPressed,
          ),
        ],
      ),
    );
  }
}
