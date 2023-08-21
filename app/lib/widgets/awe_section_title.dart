import 'package:flutter/cupertino.dart';

class AWESectionTitle extends StatelessWidget {
  final String title;

  const AWESectionTitle(
    this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
        ),
      ],
    );
  }
}
