import 'package:areweeven/widgets/awe_button.dart';
import 'package:areweeven/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'scrollable_content.dart';

class BottomButton {
  final String title;
  final Function()? onPressed;

  BottomButton({
    required this.title,
    this.onPressed,
  });
}

class ScrollablePageWithBottomButton extends ConsumerWidget {
  /// Title below progress bar, not app bar title
  final AppBarData? appBarData;
  final String? description;

  final BottomButton? bottomButton;
  final List<Widget> children;

  const ScrollablePageWithBottomButton({
    this.appBarData,
    this.bottomButton,
    this.description,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageScaffold(
      appBarData: appBarData,
      body: ScrollableContent(
        scrollContent: children,
        bottomView: bottomButton != null
            ? AWETextButton(
                TextButtonType.primary,
                text: bottomButton!.title,
                onPressed: bottomButton!.onPressed,
              )
            : const SizedBox(),
      ),
    );
  }
}
