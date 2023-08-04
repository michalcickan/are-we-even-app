import 'package:areweeven/extensions/build_context_themes.dart';
import 'package:flutter/material.dart';

import 'awe_border_radius.dart';

typedef OnValueChanged = void Function(String);

class AWETextField extends StatefulWidget {
  final String? hintText;
  final OnValueChanged? onValueChanged;
  final bool showRemoveButton;
  final void Function(bool)? onFocusChanged;
  final String? initialValue;
  final bool obscureText;

  const AWETextField({
    this.hintText,
    this.onValueChanged,
    this.showRemoveButton = true,
    this.onFocusChanged,
    this.initialValue,
    this.obscureText = false,
    super.key,
  });

  @override
  State<AWETextField> createState() => _AWETextFieldState();
}

class _AWETextFieldState extends State<AWETextField>
    with WidgetsBindingObserver {
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // ensure, that initial value will be always "" and not null
    _textEditingController.text = widget.initialValue ?? "";
    _textEditingController.addListener(_textEditingListener);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surface,
      borderRadius: _borderRadius,
      child: Focus(
        onFocusChange: widget.onFocusChanged,
        child: TextField(
          obscureText: widget.obscureText,
          controller: _textEditingController,
          cursorColor: context.colorScheme.primary,
          decoration: InputDecoration(
            suffix: widget.showRemoveButton
                ? IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: _cleanText,
                  )
                : null,
            floatingLabelStyle: context.textTheme.labelSmall!.copyWith(
              color: context.colorScheme.primary,
            ),
            labelText: widget.hintText,
            labelStyle: context.textTheme.bodySmall!.copyWith(
              color: context.colorScheme.surfaceVariant,
            ),
            focusedBorder: _makeOutlinedBorder(
              context.colorScheme.primary,
            ),
            enabledBorder: _makeOutlinedBorder(
              context.colorScheme.onBackground,
            ),
          ),
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colorScheme.onBackground,
          ),
        ),
      ),
    );
  }

  AWEBorderRadius get _borderRadius => AWEBorderRadius.roundM();

  OutlineInputBorder _makeOutlinedBorder(Color color) => OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: color,
        ),
        borderRadius: _borderRadius,
      );

  void _textEditingListener() {
    widget.onValueChanged?.call(_textEditingController.text);
  }

  void _cleanText() {
    _textEditingController.text = "";
    widget.onValueChanged?.call("");
  }
}
