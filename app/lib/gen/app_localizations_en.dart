import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get or => 'or';

  @override
  String get save => 'save';

  @override
  String get logout => 'Logout';

  @override
  String get add => 'Add';

  @override
  String get cancel => 'Cancel';

  @override
  String get switchToButtonTitle => 'Switch to';

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
  String get emailHint => 'Email';

  @override
  String get passwordHint => 'Password';

  @override
  String get registrationTitle => 'Register';

  @override
  String get repeatPasswordHint => 'Repeat password';

  @override
  String get homeTabTitle => 'Home';

  @override
  String get settingsTabTitle => 'Settings';

  @override
  String get groupsTabTitle => 'Groups';

  @override
  String get appearanceTitle => 'Appearance';

  @override
  String get profileTitle => 'Profile';

  @override
  String get nameHint => 'Name';

  @override
  String get surnameHint => 'Surname';

  @override
  String get middleNameHint => 'Middle name';

  @override
  String get updatePersonalInfoTitle => 'Update basic info';

  @override
  String get addresses => 'Addresses';

  @override
  String get warning => 'Warning';

  @override
  String get info => 'Info';

  @override
  String get logoutWarningText => 'Do you really want to logout?';

  @override
  String get chooseThemeTitle => 'Choose theme';

  @override
  String get dark => 'Dark';

  @override
  String get light => 'Light';

  @override
  String get system => 'System';

  @override
  String get noAddressText => 'You have not provided any address so far.';

  @override
  String get addAddressTitle => 'Add address';

  @override
  String get zip => 'ZIP';

  @override
  String get street => 'Street';

  @override
  String get country => 'Country';

  @override
  String get emptyGroupListHint => 'You have no groups';

  @override
  String get createGroupTitle => 'Create group';

  @override
  String get groupNameHint => 'Group name';

  @override
  String get current => 'Current';

  @override
  String get yourGroupsSectionTitle => 'Your groups';

  @override
  String get groupsYouInvitedIn => 'Group Invitations';

  @override
  String get addGroupMember => 'Add group member';

  @override
  String get searchUserHint => 'email or name';

  @override
  String get unknown => 'Unknown';

  @override
  String invitationSentText(Object user_email) {
    return 'Your invitation to group was successfully sent to $user_email.';
  }

  @override
  String get noResultsFoundText => 'There are no results for this query.';

  @override
  String get searchMinimumHint => 'Please provide me at least 3 characters';

  @override
  String get groupInvitationsTitle => 'Group invitations';

  @override
  String get emptyInvitationListHint => 'You don\'t any invitation right now';

  @override
  String get invitationAcceptInfoText => 'Do you want to accept the invitation?';

  @override
  String get yes => 'yes';

  @override
  String get decline => 'decline';

  @override
  String get close => 'close';

  @override
  String get expenseTitle => 'Expense';

  @override
  String noExpensesInGroup(Object groupName) {
    return 'You have no expenses in the group with name \'$groupName\'';
  }

  @override
  String get addExpenseTitle => 'Add expense';

  @override
  String get shouldPayHint => 'Should pay';

  @override
  String get paidHint => 'Paid';

  @override
  String get addExpenseDescription => 'Add an expense you did and split it with your friends. The algorithm computes debt results as a whole from all your expenses. After the price computation, which the debtor should pay, the algorithm randomly assigns whom to pay according to who paid more than they should. It is not computed per each expense.';

  @override
  String get expenseDescriptionHint => 'Expense description';

  @override
  String get homeExpensesSectionTitle => 'Last expenses';

  @override
  String get seeAll => 'See all';

  @override
  String get expenseListTitle => 'Expenses';

  @override
  String get dueAmountTitle => 'Due amount';

  @override
  String get totalAmountTitle => 'Total amount';

  @override
  String get createdAtTitle => 'Created';
}
