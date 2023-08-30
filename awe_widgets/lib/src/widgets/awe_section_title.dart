import 'package:flutter/cupertino.dart';

class AWESectionTitle extends StatelessWidget {
  final String title;
  final Widget? rightItem;

  const AWESectionTitle(
    this.title, {
    this.rightItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 0,
      ),
      child: rightItem != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleWidget,
                rightItem!,
              ],
            )
          : _titleWidget,
    );
  }

  Widget get _titleWidget => Text(title);
}
