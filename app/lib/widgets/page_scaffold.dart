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

class AppBarData {
  final String? title;
  final List<AppBarAction>? rightActions;
  final AWETextField? searchField;

  const AppBarData({this.title, this.rightActions, this.searchField});
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
  final Widget body;
  final FloatingButton? floatingButton;
  final AppBarData? appBarData;

  const PageScaffold({
    required this.body,
    this.appBarData,
    this.floatingButton,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = ref.watch(localizationProvider);
    ref.registerErrorListener();
    ref.registerDialogListener(
      localizations,
      context,
    );

    return Scaffold(
      appBar: appBarData != null ? _makeAppBar(appBarData!) : null,
      body: SafeArea(child: body),
      floatingActionButton:
          floatingButton != null ? _makeFloatingButton(floatingButton!) : null,
    );
  }

  PreferredSizeWidget _makeAppBar(AppBarData data) => AppBar(
        title: data.title != null ? Text(data.title!) : data.searchField,
        actions: data.rightActions?.map(_makeAppBarAction).toList(),
      );

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

extension _Text on DismissDialogButtonType {
  String title(AppLocalizations localizations) {
    switch (this) {
      case DismissDialogButtonType.ok:
        return localizations.add;
      case DismissDialogButtonType.cancel:
        return localizations.cancel;
    }
  }
}
