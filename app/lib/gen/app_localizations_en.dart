import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get or => 'or';

  @override
  String get loginButtonWithEmailTitle => 'Login with email';

  @override
  String get loginButtonWithGoogleTitle => 'Login with Google';

  @override
  String get registerButtonWithEmailTitle => 'Sign up';

  @override
  String get loginTitle => 'Login';

  @override
  String get loginButtonTitle => 'Login';

  @override
  String get emailPlaceholder => 'Email';

  @override
  String get passwordPlaceholder => 'Password';

  @override
  String get registrationTitle => 'Register';

  @override
  String get repeatPasswordPlaceholder => 'Repeat password';
}
