import 'package:areweeven/gen/app_localizations.dart';
import 'package:awe_api/awe_api.dart';
import 'package:flutter/material.dart';

import 'list_item_view_model.dart';

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
        subtitle: group.isDefault ?? false
            ? Subtitle(
                text: localizations.current,
                type: SubtitleType.selectionIndicator,
              )
            : null,
      );
}
