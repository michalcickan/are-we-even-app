import 'package:areweeven/pages/add_expense/add_expense_page.dart';
import 'package:areweeven/pages/expense_list/expense_list_page.dart';
import 'package:areweeven/widgets/awe_dialog_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes_global_keys.dart';

const shelledExpenseRoutes = [
  TypedGoRoute<ExpenseListRoute>(path: "expense-list"),
];

const expensesRoutes = [
  TypedGoRoute<AddExpenseRoute>(path: "add-expense"),
];

class AddExpenseRoute extends GoRouteData {
  final int groupId;

  const AddExpenseRoute(
    this.groupId,
  );

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return AWEDialogPage(
      key: state.pageKey,
      builder: (_) => AddExpensePage(groupId),
    );
  }
}

class ExpenseListRoute extends GoRouteData {
  // https://github.com/flutter/flutter/issues/129878
  // final int groupId;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  const ExpenseListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ExpenseListPage();
  }
}

class ExpenseDetailRoute extends GoRouteData {
  const ExpenseDetailRoute() : super();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ExpenseListPage();
  }
}
