import 'package:areweeven/pages/choose_option/choose_theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'choose_option_item.dart';

part 'choose_option_providers.g.dart';

class ChooseOptionTexts {
  final String title;

  ChooseOptionTexts({
    required this.title,
  });
}

enum ChooseOptionType {
  theme,
}

@riverpod
ChooseOptionTexts chooseOptionTexts(
  ChooseOptionTextsRef ref,
  ChooseOptionType type,
) {
  switch (type) {
    case ChooseOptionType.theme:
      return ref.chooseThemeTexts;
  }
}

@riverpod
List<ChooseOptionItem> chooseOptionItems(
  ChooseOptionItemsRef ref,
  ChooseOptionType type,
) {
  switch (type) {
    case ChooseOptionType.theme:
      return ref.choseThemeItems;
  }
}
