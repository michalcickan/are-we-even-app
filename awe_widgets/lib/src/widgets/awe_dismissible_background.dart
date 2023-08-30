import 'package:awe_widgets/src/foundation/awe_sizes.dart';
import 'package:awe_widgets/src/utils/build_context_themes.dart';
import 'package:flutter/material.dart';

enum DismissibleBackgroundType {
  delete,
}

class AWEDismissibleBackground extends StatelessWidget {
  final DismissibleBackgroundType type;

  const AWEDismissibleBackground(
    this.type, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styleInfo = type.styleInfo(context);
    return Container(
      color: styleInfo.backgroundColor, // Background color when swiped
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(
        right: AWESizes.medium,
      ),
      child: Icon(
        styleInfo.iconData,
        color: styleInfo.iconColor,
      ),
    );
  }
}

extension _Styles on DismissibleBackgroundType {
  _StyleInfo styleInfo(BuildContext context) {
    switch (this) {
      case DismissibleBackgroundType.delete:
        return _StyleInfo(
          context.colorScheme.error,
          context.colorScheme.onError,
          Icons.delete,
        );
    }
  }
}

class _StyleInfo {
  final Color backgroundColor;
  final Color iconColor;
  final IconData iconData;

  _StyleInfo(
    this.backgroundColor,
    this.iconColor,
    this.iconData,
  );
}
