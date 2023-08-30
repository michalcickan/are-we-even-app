import 'package:awe_widgets/awe_widgets.dart';
import 'package:flutter/material.dart';

class TextFieldInfo {
  final String? hint;
  final void Function(String) onChangeValue;
  final bool isSecure;

  TextFieldInfo(
    this.hint,
    this.onChangeValue, {
    this.isSecure = false,
  });
}

extension Inputs on List<TextFieldInfo> {
  List<Widget> get inputs => expand(
        (e) => [
          AWETextField(
            TextFieldType.basic,
            hintText: e.hint,
            onValueChanged: e.onChangeValue,
            obscureText: e.isSecure,
          ),
          const SizedBox(
            height: AWESizes.small,
          ),
        ],
      ).toList();
}
