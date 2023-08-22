import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dialog_provider.g.dart';

@riverpod
class Dialog extends _$Dialog {
  @override
  DialogInfo? build() {
    return null;
  }

  void showDialog(DialogInfo dialogInfo) {
    state = dialogInfo;
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

enum DismissDialogButtonType {
  cancel,
  ok,
}

class DialogInfo {
  final String title;
  final String? text;
  final DismissDialogButtonType? dismissDialogButtonType;
  final VoidCallback? onDismiss;
  final List<DialogActionItem>? actionItems;

  DialogInfo(
    this.title, {
    this.actionItems,
    this.text,
    this.dismissDialogButtonType = DismissDialogButtonType.ok,
    this.onDismiss,
  });
}
