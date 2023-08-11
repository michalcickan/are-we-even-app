import 'package:areweeven/gen/app_localizations.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/global_providers/theme_provider.dart';
import 'package:areweeven/pages/choose_option/choose_option_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'choose_option_item.dart';

extension ChooseTheme on ProviderRef {
  List<ChooseOptionItem> get choseThemeItems {
    final localizations = read(localizationProvider);
    final currentTheme = watch(themeProvider);
    onPressed(ThemeMode mode) =>
        () => read(themeProvider.notifier).updateTheme(mode);
    return ThemeMode.values
        .map(
          (theme) => ChooseOptionItem(
            theme.title(
              localizations,
            ),
            onPressed(theme),
            theme == currentTheme,
          ),
        )
        .toList();
  }

  ChooseOptionTexts get chooseThemeTexts => ChooseOptionTexts(
        title: read(localizationProvider).chooseThemeTitle,
      );
}

extension _Texts on ThemeMode {
  String title(AppLocalizations localizations) {
    switch (this) {
      case ThemeMode.light:
        return localizations.light;
      case ThemeMode.dark:
        return localizations.dark;
      case ThemeMode.system:
        return localizations.system;
    }
  }
}
