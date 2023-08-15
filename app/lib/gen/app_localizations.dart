import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'save'**
  String get save;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @loginButtonWithEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Login with email'**
  String get loginButtonWithEmailTitle;

  /// No description provided for @loginButtonWithGoogleTitle.
  ///
  /// In en, this message translates to:
  /// **'Login with Google'**
  String get loginButtonWithGoogleTitle;

  /// No description provided for @registerButtonWithEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get registerButtonWithEmailTitle;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginTitle;

  /// No description provided for @loginButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButtonTitle;

  /// No description provided for @emailPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailPlaceholder;

  /// No description provided for @passwordPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordPlaceholder;

  /// No description provided for @registrationTitle.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registrationTitle;

  /// No description provided for @repeatPasswordPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Repeat password'**
  String get repeatPasswordPlaceholder;

  /// No description provided for @homeTabTitle.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTabTitle;

  /// No description provided for @settingsTabTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTabTitle;

  /// No description provided for @groupsTabTitle.
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get groupsTabTitle;

  /// No description provided for @appearanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearanceTitle;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @namePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get namePlaceholder;

  /// No description provided for @surnamePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get surnamePlaceholder;

  /// No description provided for @middleNamePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Middle name'**
  String get middleNamePlaceholder;

  /// No description provided for @updatePersonalInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Update basic info'**
  String get updatePersonalInfoTitle;

  /// No description provided for @addresses.
  ///
  /// In en, this message translates to:
  /// **'Addresses'**
  String get addresses;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning;

  /// No description provided for @logoutWarningText.
  ///
  /// In en, this message translates to:
  /// **'Do you really want to logout?'**
  String get logoutWarningText;

  /// No description provided for @chooseThemeTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose theme'**
  String get chooseThemeTitle;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @noAddressText.
  ///
  /// In en, this message translates to:
  /// **'You have not provided any address so far.'**
  String get noAddressText;

  /// No description provided for @addAddressTitle.
  ///
  /// In en, this message translates to:
  /// **'Add address'**
  String get addAddressTitle;

  /// No description provided for @zip.
  ///
  /// In en, this message translates to:
  /// **'ZIP'**
  String get zip;

  /// No description provided for @street.
  ///
  /// In en, this message translates to:
  /// **'Street'**
  String get street;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @emptyGroupListPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'You have no groups'**
  String get emptyGroupListPlaceholder;

  /// No description provided for @createGroupTitle.
  ///
  /// In en, this message translates to:
  /// **'Create group'**
  String get createGroupTitle;

  /// No description provided for @groupNamePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Group name'**
  String get groupNamePlaceholder;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
