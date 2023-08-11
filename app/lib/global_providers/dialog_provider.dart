import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dialog_provider.g.dart';

@riverpod
class Dialog extends _$Dialog {
  @override
  DialogInfo? build() {
    return null;
  }
}

class DialogActionItem {
  final String text;
  final VoidCallback action;

  DialogActionItem(
    this.text,
    this.action,
  );
}

class DialogInfo {
  final String title;
  final String? text;
  final bool showCancelButton;
  final List<DialogActionItem>? actionItems;

  DialogInfo(
    this.title, {
    this.actionItems,
    this.text,
    this.showCancelButton = true,
  });
}
