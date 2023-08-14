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
      child: Card(
        elevation: 1.0,
        child: Text(text),
      ),
    );
  }
}

extension _Styles on EmptyPlaceholderType {}
