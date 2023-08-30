import 'awe_card.dart';
import 'package:flutter/material.dart';

enum EmptyPlaceholderType {
  list,
}

class AWEEmptyPlaceholder extends StatelessWidget {
  final EmptyPlaceholderType type;
  final String text;

  const AWEEmptyPlaceholder(
    this.type, {
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AWECard(
        CardType.defaultIndentation,
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

extension _Styles on EmptyPlaceholderType {}
