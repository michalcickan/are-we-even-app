import 'package:areweeven/utils/extensions/build_context_themes.dart';
import 'package:areweeven/widgets/sizes.dart';
import 'package:flutter/material.dart';

import 'awe_border_radius.dart';

typedef OnValueChanged = void Function(String);

enum TextFieldType { basic, search }

class AWETextField extends StatefulWidget {
  final TextFieldType type;
  final String? hintText;
  final OnValueChanged? onValueChanged;
  final bool showRemoveButton;
  final void Function(bool)? onFocusChanged;
  final String? initialValue;
  final bool obscureText;

  const AWETextField(
    this.type, {
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
    final shouldHaveFloatLabel =
        widget.type.floatingLabelStyle(context) != null;
    return Material(
      color: context.colorScheme.surface,
      borderRadius: widget.type.borderRadius,
      child: Focus(
        onFocusChange: widget.onFocusChanged,
        child: TextField(
          obscureText: widget.obscureText,
          controller: _textEditingController,
          cursorColor: context.colorScheme.primary,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(
              Sizes.large,
            ),
            labelText: shouldHaveFloatLabel ? widget.hintText : null,
            hintText: !shouldHaveFloatLabel ? widget.hintText : null,
            suffixIcon: widget.showRemoveButton
                ? IconButton(
                    icon: const Icon(
                      Icons.close,
                    ),
                    onPressed: _cleanText,
                  )
                : null,
            floatingLabelStyle: widget.type.floatingLabelStyle(context),
            labelStyle: context.textTheme.bodyMedium!.copyWith(
              color: context.colorScheme.onSurface.withAlpha(
                128,
              ),
            ),
            focusedBorder: widget.type.border(
              context,
              true,
            ),
            enabledBorder: widget.type.border(
              context,
              false,
            ),
          ),
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }

  void _textEditingListener() {
    widget.onValueChanged?.call(_textEditingController.text);
  }

  void _cleanText() {
    _textEditingController.text = "";
    widget.onValueChanged?.call("");
  }
}

extension _Style on TextFieldType {
  TextStyle? floatingLabelStyle(BuildContext context) {
    switch (this) {
      case TextFieldType.basic:
        return context.textTheme.labelSmall!.copyWith(
          color: context.colorScheme.primary,
        );
      case TextFieldType.search:
        return null;
    }
  }

  OutlineInputBorder? border(BuildContext context, bool isFocused) {
    switch (this) {
      case TextFieldType.basic:
        return OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: isFocused
                ? context.colorScheme.primary
                : context.colorScheme.onBackground,
          ),
          borderRadius: borderRadius,
        );
      case TextFieldType.search:
        return null;
    }
  }

  AWEBorderRadius get borderRadius => AWEBorderRadius.roundM();
}
