import 'package:areweeven/gen/app_localizations.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/global_providers/theme_provider.dart';
import 'package:areweeven/pages/choose_option/choose_option_providers.dart';
import 'package:areweeven/view_models/list_item_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension ChooseTheme on ProviderRef {
  List<ListItemViewModel> get choseThemeItems {
    final localizations = read(localizationProvider);
    final currentTheme = watch(themeProvider);
    onPressed(ThemeMode mode) =>
        () => read(themeProvider.notifier).updateTheme(mode);
    return ThemeMode.values
        .map(
          (theme) => ListItemViewModel(
            theme.index,
            title: theme.title(
              localizations,
            ),
            onPressed: onPressed(theme),
            trailingType: theme == currentTheme
                ? const ListItemTrailingType.checkbox()
                : null,
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
