import 'package:areweeven/pages/choose_option/choose_theme.dart';
import 'package:areweeven/view_models/list_item_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
List<ListItemViewModel> chooseOptionItems(
  ChooseOptionItemsRef ref,
  ChooseOptionType type,
) {
  switch (type) {
    case ChooseOptionType.theme:
      return ref.choseThemeItems;
  }
}
