import 'package:areweeven/gen/app_localizations.dart';
import 'package:awe_api/awe_api.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'view_model.dart';

part 'list_item_view_models.freezed.dart';

@freezed
class ListItemTrailingType with _$ListItemTrailingType {
  const factory ListItemTrailingType.navigation() = ArrowRight;

  const factory ListItemTrailingType.switcher(
    bool value,
    void Function(bool) onValueChanged,
  ) = Switcher;

  const factory ListItemTrailingType.checkbox() = Checkbox;
}

class ListItemViewModel<ID> extends ViewModel<ID> {
  String title;
  String? subtitle;
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
      subtitle: user.email,
    );
  }
}

class CheckboxListItemViewModel<ID> extends ListItemViewModel<ID> {
  CheckboxListItemViewModel(
    super.id, {
    required super.title,
    required super.onPressed,
    super.iconData,
    super.subtitle,
  });
}

class RemovableListItemViewModel<ID> extends ListItemViewModel<ID> {
  final VoidCallback onPressedRemove;

  RemovableListItemViewModel(
    super.id, {
    required this.onPressedRemove,
    required super.onPressed,
    required super.title,
    super.subtitle,
  });

  static RemovableListItemViewModel<int> fromGroup(
    Group group, {
    required AppLocalizations localizations,
    required Function(Group) onDidTapRemove,
    required Function(Group) onPressed,
  }) =>
      RemovableListItemViewModel(
        group.id,
        onPressedRemove: () => onDidTapRemove(group),
        onPressed: () => onPressed(group),
        title: group.name,
        subtitle: group.isDefault ?? false ? localizations.current : null,
      );
}
