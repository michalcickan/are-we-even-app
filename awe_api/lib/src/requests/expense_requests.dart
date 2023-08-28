import 'package:awe_api/awe_api.dart';
import 'package:awe_api/src/endpoint.dart';
import 'package:awe_api/src/extensions/list_for_serialization.dart';

extension ExpenseRequests on AweAPIClient {
  Future<Expense> addExpense(int groupId, AddExpenseParameters parameters) =>
      post(
        Endpoint.groupExpense(groupId),
        Expense.fromJson,
        params: parameters,
      );

  Future<PagedDataResponse<Expense>> getAllExpenses(
    int groupId,
    AllExpensesParameters? parameters,
  ) =>
      getPagedData(
        Endpoint.groupExpenses(groupId),
        Expense.fromJson,
        params: parameters,
      );

  Future<List<Invitation>> updateExpense(
    UpdateExpenseParameters parameters,
    int expenseId,
  ) =>
      put(
        Endpoint.expense(expenseId),
        <Invitation>[].fromJson(Invitation.fromJson),
        params: parameters,
      );
}
