import 'package:areweeven/utils/extensions/build_context_themes.dart';
import 'package:areweeven/widgets/awe_border_radius.dart';
import 'package:flutter/material.dart';

enum ListItemType {
  option,
  selectionIndicator,
}

class AWEListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? iconData;
  final ListItemType type;
  final VoidCallback? onPressed;
  final Widget? trailing;

  const AWEListTile(
    this.type, {
    required this.title,
    this.iconData,
    this.onPressed,
    this.trailing,
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
      trailing: trailing,
    );
  }
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
