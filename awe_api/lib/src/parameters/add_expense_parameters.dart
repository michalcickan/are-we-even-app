import 'package:awe_api/src/json_convertable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'expense_payer_parameters.dart';

part 'add_expense_parameters.g.dart';

@JsonSerializable()
class AddExpenseParameters extends JsonConvertable {
  final List<ExpensePayerParameters> users;
  final String description;

  AddExpenseParameters({
    required this.users,
    required this.description,
  });

  factory AddExpenseParameters.fromJson(Map<String, dynamic> json) =>
      _$AddExpenseParametersFromJson(json);

  Map<String, dynamic> toJson() => _$AddExpenseParametersToJson(this);
}
