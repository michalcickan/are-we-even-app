import 'package:areweeven/widgets/awe_button.dart';
import 'package:areweeven/widgets/awe_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
