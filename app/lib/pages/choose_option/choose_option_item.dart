import 'dart:ui';

class ChooseOptionItem {
  String title;
  VoidCallback onPressed;
  bool selected;

  ChooseOptionItem(
    this.title,
    this.onPressed,
    this.selected,
  );
}
