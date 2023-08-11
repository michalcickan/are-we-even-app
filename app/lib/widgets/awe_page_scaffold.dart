import 'package:flutter/material.dart';

class AWEPageScaffold extends StatelessWidget {
  final String? title;
  final Widget body;

  const AWEPageScaffold({
    required this.body,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != null
          ? AppBar(
              title: Text(title!),
            )
          : null,
      body: SafeArea(child: body),
    );
  }
}
