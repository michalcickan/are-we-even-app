import 'package:areweeven/widgets/awe_border_radius.dart';
import 'package:flutter/material.dart';

import 'sizes.dart';

enum CardType {
  defaultIndentation,
}

class AWECard extends StatelessWidget {
  final CardType type;
  final Widget child;

  const AWECard(
    this.type, {
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: AWEBorderRadius.roundXxxl(),
      ),
      child: Padding(
        padding: type.padding,
        child: child,
      ),
    );
  }
}

extension _Styles on CardType {
  EdgeInsets get padding {
    switch (this) {
      case CardType.defaultIndentation:
        return const EdgeInsets.all(
          Sizes.medium,
        );
    }
  }
}
