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

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @switchToButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Switch to'**
  String get switchToButtonTitle;

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

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailHint;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordHint;

  /// No description provided for @registrationTitle.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registrationTitle;

  /// No description provided for @repeatPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Repeat password'**
  String get repeatPasswordHint;

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

  /// No description provided for @nameHint.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameHint;

  /// No description provided for @surnameHint.
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get surnameHint;

  /// No description provided for @middleNameHint.
  ///
  /// In en, this message translates to:
  /// **'Middle name'**
  String get middleNameHint;

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

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

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

  /// No description provided for @emptyGroupListHint.
  ///
  /// In en, this message translates to:
  /// **'You have no groups'**
  String get emptyGroupListHint;

  /// No description provided for @createGroupTitle.
  ///
  /// In en, this message translates to:
  /// **'Create group'**
  String get createGroupTitle;

  /// No description provided for @groupNameHint.
  ///
  /// In en, this message translates to:
  /// **'Group name'**
  String get groupNameHint;

  /// No description provided for @current.
  ///
  /// In en, this message translates to:
  /// **'Current'**
  String get current;

  /// No description provided for @yourGroupsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Your groups'**
  String get yourGroupsSectionTitle;

  /// No description provided for @groupsYouInvitedIn.
  ///
  /// In en, this message translates to:
  /// **'Group Invitations'**
  String get groupsYouInvitedIn;

  /// No description provided for @addGroupMember.
  ///
  /// In en, this message translates to:
  /// **'Add group member'**
  String get addGroupMember;

  /// No description provided for @searchUserHint.
  ///
  /// In en, this message translates to:
  /// **'email or name'**
  String get searchUserHint;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @invitationSentText.
  ///
  /// In en, this message translates to:
  /// **'Your invitation to group was successfully sent to {user_email}.'**
  String invitationSentText(Object user_email);

  /// No description provided for @noResultsFoundText.
  ///
  /// In en, this message translates to:
  /// **'There are no results for this query.'**
  String get noResultsFoundText;

  /// No description provided for @searchMinimumHint.
  ///
  /// In en, this message translates to:
  /// **'Please provide me at least 3 characters'**
  String get searchMinimumHint;

  /// No description provided for @groupInvitationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Group invitations'**
  String get groupInvitationsTitle;

  /// No description provided for @emptyInvitationListHint.
  ///
  /// In en, this message translates to:
  /// **'You don\'t any invitation right now'**
  String get emptyInvitationListHint;

  /// No description provided for @invitationAcceptInfoText.
  ///
  /// In en, this message translates to:
  /// **'Do you want to accept the invitation?'**
  String get invitationAcceptInfoText;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'yes'**
  String get yes;

  /// No description provided for @decline.
  ///
  /// In en, this message translates to:
  /// **'decline'**
  String get decline;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'close'**
  String get close;

  /// No description provided for @expenseTitle.
  ///
  /// In en, this message translates to:
  /// **'Expense'**
  String get expenseTitle;

  /// No description provided for @noExpensesInGroup.
  ///
  /// In en, this message translates to:
  /// **'You have no expenses in the group with name \'{groupName}\''**
  String noExpensesInGroup(Object groupName);

  /// No description provided for @addExpenseTitle.
  ///
  /// In en, this message translates to:
  /// **'Add expense'**
  String get addExpenseTitle;

  /// No description provided for @shouldPayHint.
  ///
  /// In en, this message translates to:
  /// **'Should pay'**
  String get shouldPayHint;

  /// No description provided for @paidHint.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paidHint;

  /// No description provided for @addExpenseDescription.
  ///
  /// In en, this message translates to:
  /// **'Add an expense you did and split it with your friends. The algorithm computes debt results as a whole from all your expenses. After the price computation, which the debtor should pay, the algorithm randomly assigns whom to pay according to who paid more than they should. It is not computed per each expense.'**
  String get addExpenseDescription;

  /// No description provided for @expenseDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Expense description'**
  String get expenseDescriptionHint;

  /// No description provided for @homeExpensesSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Last expenses'**
  String get homeExpensesSectionTitle;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeAll;

  /// No description provided for @expenseListTitle.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get expenseListTitle;

  /// No description provided for @dueAmountTitle.
  ///
  /// In en, this message translates to:
  /// **'Should pay'**
  String get dueAmountTitle;

  /// No description provided for @totalAmountTitle.
  ///
  /// In en, this message translates to:
  /// **'Total amount'**
  String get totalAmountTitle;

  /// No description provided for @createdAtTitle.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get createdAtTitle;

  /// No description provided for @membersSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get membersSectionTitle;
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
