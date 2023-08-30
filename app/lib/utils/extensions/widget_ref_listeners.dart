import 'package:areweeven/gen/app_localizations.dart';
import 'package:areweeven/global_providers/dialog_provider.dart';
import 'package:areweeven/global_providers/global_error_provider.dart';
import 'package:areweeven/global_providers/go_router_provider.dart';
import 'package:awe_widgets/awe_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension Listeners on WidgetRef {
  void registerErrorListener() {
    listen(
      globalErrorProvider,
      (_, text) {
        if (text == null) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(text),
            duration: const Duration(seconds: 3),
          ),
        );
      },
    );
  }

  void registerDialogListener(
    AppLocalizations localizations,
    BuildContext context,
  ) {
    listen(dialogProvider, (previous, next) async {
      if (next == null || ModalRoute.of(context)?.isCurrent == false) return;
      dismissAction() {
        read(goRouterProvider).pop();
      }

      List<DialogAction> allActionItems = next.dismissDialogButtonType != null
          ? [
              DialogAction(
                next.dismissDialogButtonType!.title(localizations),
                dismissAction,
              ),
            ]
          : [];
      if (next.actionItems != null) {
        allActionItems.addAll(
          next!.actionItems!.convertItems(dismissAction),
        );
      }
      await showDialog(
        context: context,
        builder: (context) => AWEDialog(
          title: next.title,
          text: next.text,
          actions: allActionItems.toList(),
        ),
      );

      if (next.onDismiss != null) {
        next.onDismiss!();
      }
    });
  }
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

extension _Text on DismissDialogButtonType {
  String title(AppLocalizations localizations) {
    switch (this) {
      case DismissDialogButtonType.ok:
        return localizations.close;
      case DismissDialogButtonType.cancel:
        return localizations.cancel;
    }
  }
}
