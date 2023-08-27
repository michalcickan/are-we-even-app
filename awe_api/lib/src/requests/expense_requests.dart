import 'package:awe_api/awe_api.dart';
import 'package:awe_api/src/endpoint.dart';
import 'package:awe_api/src/extensions/list_for_serialization.dart';

extension ExpenseRequests on AweAPIClient {
  Future<Expense> addExpense(AddExpenseParameters parameters) => post(
        Endpoint.group(),
        Expense.fromJson,
        params: parameters,
      );

  Future<PagedDataResponse<Expense>> getAllExpenses(int groupId) =>
      getPagedData(
        Endpoint.groupExpenses(groupId),
        Expense.fromJson,
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
