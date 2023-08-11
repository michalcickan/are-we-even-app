import 'package:areweeven/global_providers/storage_manager_provider.dart';
import 'package:areweeven/managers/storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
class Theme extends _$Theme {
  @override
  ThemeMode build() {
    ref.read(storageManagerProvider).read(StoreKey.theme).then(
          (value) => state = _themeFromStringMap[value] ?? ThemeMode.system,
        );
    return ThemeMode.system;
  }

  void updateTheme(ThemeMode mode) {
    ref.read(storageManagerProvider).save(
          StoreKey.theme,
          mode.toString(),
          securely: false,
        );
    state = mode;
  }
}

const Map<String, ThemeMode> _themeFromStringMap = {
  "ThemeMode.system": ThemeMode.system,
  "ThemeMode.dark": ThemeMode.dark,
  "ThemeMode.light": ThemeMode.light,
};
