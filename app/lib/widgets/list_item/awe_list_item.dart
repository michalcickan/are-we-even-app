import 'package:areweeven/utils/extensions/build_context_themes.dart';
import 'package:areweeven/widgets/awe_border_radius.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'awe_list_item.freezed.dart';

enum ListItemType {
  option,
  selectionIndicator,
}

@freezed
class ListItemTrailingType with _$ListItemTrailingType {
  const factory ListItemTrailingType.navigation() = ArrowRight;

  const factory ListItemTrailingType.switcher(
    bool value,
    void Function(bool) onValueChanged,
  ) = Switcher;

  const factory ListItemTrailingType.checkbox() = Checkbox;
}

class AWEListItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? iconData;
  final ListItemType type;
  final VoidCallback? onPressed;
  final ListItemTrailingType? trailingType;

  const AWEListItem(
    this.type, {
    required this.title,
    this.iconData,
    this.onPressed,
    this.trailingType,
    this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: AWEBorderRadius.roundM(),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: type.subtitleTextStyle(context),
            )
          : null,
      tileColor: context.colorScheme.surface,
      title: Text(
        title,
      ),
      leading: iconData != null
          ? Icon(
              iconData,
            )
          : null,
      trailing: trailingType?.widget(
        context,
      ),
    );
  }
}

extension _Widgets on ListItemTrailingType {
  Widget widget(BuildContext context) => when(
        navigation: () => const Icon(
          Icons.arrow_right,
        ),
        switcher: (value, onValueChanged) => Switch(
          value: value,
          onChanged: onValueChanged,
        ),
        checkbox: () => const Icon(Icons.check),
      );
}

extension _Styles on ListItemType {
  TextStyle? subtitleTextStyle(BuildContext context) {
    switch (this) {
      case ListItemType.selectionIndicator:
        return context.textTheme.labelSmall?.copyWith(
          color: context.colorScheme.secondary,
        );
      case ListItemType.option:
        return context.textTheme.bodySmall;
    }
  }
}
