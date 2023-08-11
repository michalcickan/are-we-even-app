import 'package:areweeven/global_providers/global_error_provider.dart';
import 'package:areweeven/widgets/awe_button.dart';
import 'package:areweeven/widgets/awe_page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'scrollable_content.dart';

class ScrollablePageWithBottomButton extends ConsumerWidget {
  /// Title below progress bar, not app bar title
  final String? title;
  final String? description;

  /// use for views, which should be above the bottom button
  final List<Widget>? bottomAdditionalViews;

  /// Title for the bottom button
  final String bottomButtonTitle;
  final VoidCallback? bottomButtonOnPressed;
  final List<Widget> children;

  const ScrollablePageWithBottomButton({
    this.title,
    required this.bottomButtonTitle,
    this.description,
    this.bottomAdditionalViews,
    this.bottomButtonOnPressed,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      globalErrorProvider,
      (_, text) {
        if (text == null) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(text),
            duration: const Duration(seconds: 3),
          ),
        );
      },
    );
    return AWEPageScaffold(
      title: title,
      body: ScrollableContent(
        scrollContent: children,
        bottomView: bottomAdditionalViews != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...bottomAdditionalViews!,
                  _makeBottomButton(context),
                ],
              )
            : _makeBottomButton(context),
      ),
    );
  }

  Widget _makeBottomButton(BuildContext context) => AWETextButton(
        TextButtonType.primary,
        text: bottomButtonTitle,
        onPressed: bottomButtonOnPressed,
      );
}
