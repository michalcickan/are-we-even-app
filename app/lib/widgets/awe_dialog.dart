import 'package:flutter/material.dart';

class DialogAction {
  final String text;
  final VoidCallback onPressed;

  DialogAction(
    this.text,
    this.onPressed,
  );
}

class AWEDialog extends StatelessWidget {
  final String title;
  final String? text;
  final List<DialogAction>? actions;

  const AWEDialog({
    required this.title,
    this.text,
    this.actions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: text != null ? _makeContent() : null,
      actions: actions != null ? _makeActions() : null,
    );
  }

  Widget _makeContent() => Text(text!);

  List<Widget> _makeActions() => actions!
      .map((action) => TextButton(
            onPressed: action.onPressed,
            child: Text(action.text.toUpperCase()),
          ))
      .toList();
}
