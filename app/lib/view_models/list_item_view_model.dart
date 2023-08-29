import 'package:areweeven/gen/app_localizations.dart';
import 'package:awe_api/awe_api.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'view_model.dart';

part 'list_item_view_model.freezed.dart';

@freezed
class ListItemTrailingType with _$ListItemTrailingType {
  const factory ListItemTrailingType.navigation() = ArrowRight;

  const factory ListItemTrailingType.switcher(
    bool value,
    void Function(bool) onValueChanged,
  ) = Switcher;

  const factory ListItemTrailingType.checkbox() = Checkbox;
}

enum SubtitleType {
  selectionIndicator,
  info,
}

class Subtitle {
  final String text;
  final SubtitleType type;

  const Subtitle({
    required this.text,
    required this.type,
  });
}

class ListItemViewModel<ID> extends ViewModel<ID> {
  String title;
  Subtitle? subtitle;
  VoidCallback onPressed;
  IconData? iconData;
  ListItemTrailingType? trailingType;

  ListItemViewModel(
    super.id, {
    required this.title,
    required this.onPressed,
    this.iconData,
    this.subtitle,
    this.trailingType = const ListItemTrailingType.navigation(),
  });

  static ListItemViewModel<int> fromUser(
    User user, {
    required AppLocalizations localizations,
    required Function(User) onPressed,
  }) {
    return ListItemViewModel(
      user.id,
      onPressed: () => onPressed(user),
      title: user.name ?? localizations.unknown,
      subtitle: Subtitle(
        text: user.email,
        type: SubtitleType.info,
      ),
    );
  }

  static ListItemViewModel<int> fromExpense(
    Expense expense, {
    required AppLocalizations localizations,
    required Function(Expense) onPressed,
  }) {
    return ListItemViewModel(
      expense.id,
      title: expense.description,
      onPressed: () => onPressed(expense),
    );
  }
}
