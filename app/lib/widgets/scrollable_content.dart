import 'package:areweeven/widgets/sizes.dart';
import 'package:flutter/material.dart';

class ScrollableContent extends StatelessWidget {
  final List<Widget> scrollContent;
  final Widget? bottomView;

  const ScrollableContent({
    required this.scrollContent,
    this.bottomView,
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: scrollContent,
              ),
            ),
          ),
          if (bottomView != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.extraSmall,
                horizontal: Sizes.extraSmall,
              ),
              child: bottomView!,
            ),
        ],
      ),
    );
  }
}
