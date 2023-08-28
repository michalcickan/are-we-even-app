import 'package:areweeven/pages/add_expense/add_expense_page.dart';
import 'package:areweeven/widgets/awe_dialog_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const expenseRoutes = [
  TypedGoRoute<AddExpenseRoute>(path: "add-expense"),
];

class AddExpenseRoute extends GoRouteData {
  final int groupId;

  const AddExpenseRoute(
    this.groupId,
  );

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return AWEDialogPage(builder: (_) => AddExpensePage(groupId));
  }
}
