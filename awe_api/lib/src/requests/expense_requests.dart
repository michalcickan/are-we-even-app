import 'package:awe_api/src/awe_api_client.dart';
import 'package:awe_api/src/endpoint.dart';
import 'package:awe_api/src/extensions/list_for_serialization.dart';
import 'package:awe_api/src/models/expense.dart';
import 'package:awe_api/src/models/invitation.dart';
import 'package:awe_api/src/models/paged_data_response.dart';
import 'package:awe_api/src/parameters/add_expense_parameters.dart';
import 'package:awe_api/src/parameters/all_expenses_parameters.dart';
import 'package:awe_api/src/parameters/update_expense_parameters.dart';

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

  Future<Expense> getExpense(
    int expenseId,
  ) =>
      get(
        Endpoint.expense(expenseId),
        Expense.fromJson,
      );
}
