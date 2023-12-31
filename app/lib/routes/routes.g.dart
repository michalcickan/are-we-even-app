// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $rootRoute,
    ];

RouteBase get $rootRoute => GoRouteData.$route(
      path: '/',
      factory: $RootRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'welcome',
          factory: $WelcomeRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'login',
          factory: $LoginRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'registration',
          factory: $RegistrationRouteExtension._fromState,
        ),
        StatefulShellRouteData.$route(
          factory: $AppScaffoldShellRouteExtension._fromState,
          branches: [
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: 'home',
                  factory: $HomeRouteExtension._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'expense-list',
                      factory: $ExpenseListRouteExtension._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'expense-detail',
                      factory: $ExpenseDetailRouteExtension._fromState,
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: 'groups',
                  factory: $GroupListRouteExtension._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'group-detail',
                      factory: $GroupDetailRouteExtension._fromState,
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              navigatorKey: SettingsBranch.$navigatorKey,
              routes: [
                GoRouteData.$route(
                  path: 'settings',
                  factory: $SettingsRouteExtension._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'profile',
                      factory: $ProfileRouteExtension._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'appearance',
                      factory: $AppearanceRouteExtension._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'update-profile',
                      factory: $UpdateProfileRouteExtension._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'choose-option',
                      factory: $ChooseOptionRouteExtension._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'addresses',
                      factory: $AddressesRouteExtension._fromState,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'create-group',
          parentNavigatorKey: CreateGroupRoute.$parentNavigatorKey,
          factory: $CreateGroupRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'add-group-member',
          parentNavigatorKey: AddGroupMemberRoute.$parentNavigatorKey,
          factory: $AddGroupMemberRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'add-expense',
          parentNavigatorKey: AddExpenseRoute.$parentNavigatorKey,
          factory: $AddExpenseRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'add-address',
          parentNavigatorKey: AddAddressRoute.$parentNavigatorKey,
          factory: $AddAddressRouteExtension._fromState,
        ),
      ],
    );

extension $RootRouteExtension on RootRoute {
  static RootRoute _fromState(GoRouterState state) => const RootRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $WelcomeRouteExtension on WelcomeRoute {
  static WelcomeRoute _fromState(GoRouterState state) => const WelcomeRoute();

  String get location => GoRouteData.$location(
        '/welcome',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RegistrationRouteExtension on RegistrationRoute {
  static RegistrationRoute _fromState(GoRouterState state) =>
      const RegistrationRoute();

  String get location => GoRouteData.$location(
        '/registration',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AppScaffoldShellRouteExtension on AppScaffoldShellRoute {
  static AppScaffoldShellRoute _fromState(GoRouterState state) =>
      const AppScaffoldShellRoute();
}

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ExpenseListRouteExtension on ExpenseListRoute {
  static ExpenseListRoute _fromState(GoRouterState state) =>
      const ExpenseListRoute();

  String get location => GoRouteData.$location(
        '/home/expense-list',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ExpenseDetailRouteExtension on ExpenseDetailRoute {
  static ExpenseDetailRoute _fromState(GoRouterState state) =>
      ExpenseDetailRoute(
        _$convertMapValue('expense-id', state.uri.queryParameters, int.parse),
      );

  String get location => GoRouteData.$location(
        '/home/expense-detail',
        queryParams: {
          if (expenseId != null) 'expense-id': expenseId!.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GroupListRouteExtension on GroupListRoute {
  static GroupListRoute _fromState(GoRouterState state) =>
      const GroupListRoute();

  String get location => GoRouteData.$location(
        '/groups',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GroupDetailRouteExtension on GroupDetailRoute {
  static GroupDetailRoute _fromState(GoRouterState state) => GroupDetailRoute(
        _$convertMapValue('group-id', state.uri.queryParameters, int.parse),
      );

  String get location => GoRouteData.$location(
        '/groups/group-detail',
        queryParams: {
          if (groupId != null) 'group-id': groupId!.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfileRouteExtension on ProfileRoute {
  static ProfileRoute _fromState(GoRouterState state) => const ProfileRoute();

  String get location => GoRouteData.$location(
        '/settings/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AppearanceRouteExtension on AppearanceRoute {
  static AppearanceRoute _fromState(GoRouterState state) =>
      const AppearanceRoute();

  String get location => GoRouteData.$location(
        '/settings/appearance',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $UpdateProfileRouteExtension on UpdateProfileRoute {
  static UpdateProfileRoute _fromState(GoRouterState state) =>
      const UpdateProfileRoute();

  String get location => GoRouteData.$location(
        '/settings/update-profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ChooseOptionRouteExtension on ChooseOptionRoute {
  static ChooseOptionRoute _fromState(GoRouterState state) => ChooseOptionRoute(
        _$convertMapValue('type', state.uri.queryParameters,
            _$ChooseOptionTypeEnumMap._$fromName),
      );

  String get location => GoRouteData.$location(
        '/settings/choose-option',
        queryParams: {
          if (type != null) 'type': _$ChooseOptionTypeEnumMap[type!],
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

const _$ChooseOptionTypeEnumMap = {
  ChooseOptionType.theme: 'theme',
};

extension $AddressesRouteExtension on AddressesRoute {
  static AddressesRoute _fromState(GoRouterState state) =>
      const AddressesRoute();

  String get location => GoRouteData.$location(
        '/settings/addresses',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CreateGroupRouteExtension on CreateGroupRoute {
  static CreateGroupRoute _fromState(GoRouterState state) =>
      const CreateGroupRoute();

  String get location => GoRouteData.$location(
        '/create-group',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AddGroupMemberRouteExtension on AddGroupMemberRoute {
  static AddGroupMemberRoute _fromState(GoRouterState state) =>
      AddGroupMemberRoute(
        int.parse(state.uri.queryParameters['group-id']!),
      );

  String get location => GoRouteData.$location(
        '/add-group-member',
        queryParams: {
          'group-id': groupId.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AddExpenseRouteExtension on AddExpenseRoute {
  static AddExpenseRoute _fromState(GoRouterState state) => AddExpenseRoute(
        int.parse(state.uri.queryParameters['group-id']!),
      );

  String get location => GoRouteData.$location(
        '/add-expense',
        queryParams: {
          'group-id': groupId.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AddAddressRouteExtension on AddAddressRoute {
  static AddAddressRoute _fromState(GoRouterState state) =>
      const AddAddressRoute();

  String get location => GoRouteData.$location(
        '/add-address',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

extension<T extends Enum> on Map<T, String> {
  T _$fromName(String value) =>
      entries.singleWhere((element) => element.value == value).key;
}
