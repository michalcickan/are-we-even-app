import 'package:areweeven/pages/add_expense/add_expense_page.dart';
import 'package:areweeven/pages/expense_detail/expense_detail_page.dart';
import 'package:areweeven/pages/expense_list/expense_list_page.dart';
import 'package:awe_widgets/awe_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes_global_keys.dart';

const shelledExpenseRoutes = [
  TypedGoRoute<ExpenseListRoute>(path: "expense-list"),
  TypedGoRoute<ExpenseDetailRoute>(path: "expense-detail"),
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

  const ExpenseListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ExpenseListPage();
  }
}

class ExpenseDetailRoute extends GoRouteData {
  final int? expenseId;

  const ExpenseDetailRoute(this.expenseId);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ExpenseDetailPage(expenseId!);
  }
}
