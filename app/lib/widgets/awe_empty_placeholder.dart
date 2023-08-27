import 'package:areweeven/widgets/sizes.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(
            Sizes.medium,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

extension _Styles on EmptyPlaceholderType {}
