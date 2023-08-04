import 'dart:ui';

import 'package:areweeven/gen/app_localizations.dart';
import 'package:areweeven/utils/logger.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'localization_provider.g.dart';

@riverpod
class Localization extends _$Localization {
  @override
  AppLocalizations build() {
    try {
      return lookupAppLocalizations(
        Locale(
          Intl.defaultLocale ?? "en",
        ),
      );
    } catch (e) {
      logger.e(
        e.toString(),
      );
      return lookupAppLocalizations(
        const Locale("en"),
      );
    }
  }
}
