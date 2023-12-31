import 'package:awe_widgets/src/utils/build_context_themes.dart';

import '../foundation/awe_sizes.dart';
import 'package:flutter/material.dart';

import '../foundation/awe_border_radius.dart';

enum TextButtonType {
  primary,
  secondary,
  bar,
  section,
}

class AWETextButton extends StatelessWidget {
  final TextButtonType type;
  final String text;
  final VoidCallback? onPressed;
  final AxisDirection? axisDirection;

  const AWETextButton(
    this.type, {
    required this.text,
    this.onPressed,
    this.axisDirection,
    super.key,
  });

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: onPressed,
        style: type.style(context),
        child: Text(
          text.toUpperCase(),
        ),
      );
}

extension _Styles on TextButtonType {
  ButtonStyle style(BuildContext context) {
    switch (this) {
      case TextButtonType.primary:
        return const _CommonButtonStyle().copyWith(
          backgroundColor: MaterialStateProperty.resolveWith(
            _basicBackgroundColorResolver(
              context,
              (colorScheme) => colorScheme.primary,
            ),
          ),
          foregroundColor: MaterialStatePropertyAll(
            context.colorScheme.onPrimary,
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: AWEBorderRadius.roundXxxl(),
            ),
          ),
        );
      case TextButtonType.bar:
        return const _CommonButtonStyle().copyWith(
          backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
          textStyle: MaterialStatePropertyAll(context.textTheme.labelSmall),
          foregroundColor: MaterialStatePropertyAll(
            Theme.of(context).colorScheme.onPrimary,
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: AWEBorderRadius.roundXxxl(),
            ),
          ),
        );
      case TextButtonType.secondary:
        return const _CommonButtonStyle().copyWith(
          backgroundColor: MaterialStateProperty.resolveWith(
            _basicBackgroundColorResolver(
              context,
              (colorScheme) => Colors.transparent,
            ),
          ),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.disabled)
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.primary,
          ),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: AWEBorderRadius.roundXxxl(),
              side: BorderSide(
                width: 2.0,
                color: states.contains(MaterialState.disabled)
                    ? Colors.transparent
                    : Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          overlayColor: MaterialStateProperty.all(
            Colors.white.withAlpha(128),
          ),
        );
      case TextButtonType.section:
        return const _CommonButtonStyle().copyWith(
          backgroundColor: MaterialStateProperty.all(
            Colors.transparent,
          ),
          foregroundColor: MaterialStatePropertyAll(
            context.colorScheme.onPrimary,
          ),
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        );
    }
  }
}

Color Function(Set<MaterialState>) _basicBackgroundColorResolver(
  BuildContext context,
  Color Function(ColorScheme) resolve,
) =>
    (states) {
      final colorScheme = Theme.of(context).colorScheme;
      if (states.contains(MaterialState.disabled)) {
        return colorScheme.surfaceVariant;
      }
      return resolve(colorScheme);
    };

class _CommonButtonStyle extends ButtonStyle {
  const _CommonButtonStyle()
      : super(
          padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: AWESizes.medium,
              vertical: AWESizes.small,
            ),
          ),
        );
}
