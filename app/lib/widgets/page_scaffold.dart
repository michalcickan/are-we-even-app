import 'package:areweeven/global_providers/dialog_provider.dart';
import 'package:areweeven/global_providers/go_router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'awe_dialog.dart';

enum FloatingButtonType {
  add,
}

class FloatingButton {
  final String? title;
  final FloatingButtonType type;
  final VoidCallback onPressed;

  FloatingButton(
    this.type, {
    this.title,
    required this.onPressed,
  });
}

class PageScaffold extends ConsumerWidget {
  final String? title;
  final Widget body;
  final FloatingButton? floatingButton;

  const PageScaffold({
    required this.body,
    this.title,
    this.floatingButton,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(dialogProvider, (previous, next) {
      if (next == null) return;

      dismissAction() => ref.read(goRouterProvider).pop();
      List<DialogAction> allActionItems = next.showCancelButton
          ? [
              DialogAction(
                "cancel",
                dismissAction,
              ),
            ]
          : [];
      if (next.actionItems != null) {
        allActionItems.addAll(
          next!.actionItems!.convertItems(dismissAction),
        );
      }
      showDialog(
        context: context,
        builder: (context) => AWEDialog(
          title: next.title,
          text: next.text,
          actions: allActionItems.toList(),
        ),
      );
    });

    return Scaffold(
      appBar: title != null
          ? AppBar(
              title: Text(title!),
            )
          : null,
      body: SafeArea(child: body),
      floatingActionButton:
          floatingButton != null ? _makeFloatingButton(floatingButton!) : null,
    );
  }

  Widget _makeFloatingButton(FloatingButton button) => button.title == null
      ? FloatingActionButton(
          onPressed: button.onPressed,
          child: Icon(
            button.type.iconData,
          ),
        )
      : FloatingActionButton.extended(
          onPressed: button.onPressed,
          label: Text(button.title!),
          icon: Icon(
            button.type.iconData,
          ),
        );
}

extension _DialogAction on List<DialogActionItem> {
  Iterable<DialogAction> convertItems(VoidCallback dismissAction) => map(
        (e) => DialogAction(
          e.text,
          () {
            dismissAction;
            e.action();
          },
        ),
      );
}

extension _UI on FloatingButtonType {
  IconData get iconData {
    switch (this) {
      case FloatingButtonType.add:
        return Icons.add;
    }
  }
}
