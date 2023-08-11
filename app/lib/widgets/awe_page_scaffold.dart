import 'package:areweeven/global_providers/dialog_provider.dart';
import 'package:areweeven/global_providers/go_router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'awe_dialog.dart';

class AWEPageScaffold extends ConsumerWidget {
  final String? title;
  final Widget body;

  const AWEPageScaffold({
    required this.body,
    this.title,
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
        builder: (context) =>
            AWEDialog(
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
    );
  }
}

extension _DialogAction on List<DialogActionItem> {
  Iterable<DialogAction> convertItems(VoidCallback dismissAction) =>
      map(
            (e) =>
            DialogAction(
              e.text,
                  () {
                dismissAction;
                e.action();
              },
            ),
      );
}
