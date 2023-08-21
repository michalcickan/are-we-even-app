import 'package:areweeven/gen/app_localizations.dart';
import 'package:areweeven/global_providers/dialog_provider.dart';
import 'package:areweeven/global_providers/global_error_provider.dart';
import 'package:areweeven/global_providers/go_router_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/widgets/awe_button.dart';
import 'package:areweeven/widgets/awe_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'awe_dialog.dart';

class FloatingButton {
  final String? title;
  final IconData iconData;
  final VoidCallback onPressed;

  FloatingButton({
    this.title,
    required this.iconData,
    required this.onPressed,
  });
}

class AppBarAction {
  final String? title;
  final IconData? iconData;
  final Function() onPressed;

  AppBarAction({
    this.title,
    this.iconData,
    required this.onPressed,
  }) : assert(
          iconData != null || title != null,
          "You must set either iconData or title in order to show AppBarAction",
        );
}

class PageScaffold extends ConsumerWidget {
  final String? title;
  final AWETextField? appBarSearchField;
  final Widget body;
  final FloatingButton? floatingButton;
  final List<AppBarAction>? rightAppBarActions;

  const PageScaffold({
    required this.body,
    this.title,
    this.floatingButton,
    this.rightAppBarActions,
    this.appBarSearchField,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = ref.watch(localizationProvider);
    ref.registerErrorListener();
    ref.registerDialogListener(localizations);

    final showAppBar = title != null || appBarSearchField != null;
    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              title: title != null ? Text(title!) : appBarSearchField,
              actions: rightAppBarActions?.map(_makeAppBarAction).toList(),
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
            button.iconData,
          ),
        )
      : FloatingActionButton.extended(
          onPressed: button.onPressed,
          label: Text(button.title!),
          icon: Icon(
            button.iconData,
          ),
        );

  Widget _makeAppBarAction(AppBarAction action) => action.title != null
      ? AWETextButton(
          TextButtonType.primary,
          text: action.title!,
        )
      : IconButton(
          onPressed: action.onPressed,
          icon: Icon(action.iconData!),
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

extension _Listeners on WidgetRef {
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

  void registerDialogListener(AppLocalizations localizations) {
    listen(dialogProvider, (previous, next) {
      if (next == null) return;
      dismissAction() => read(goRouterProvider).pop();
      List<DialogAction> allActionItems = next.showCancelButton
          ? [
              DialogAction(
                localizations.cancel,
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
  }
}
