import 'package:json_annotation/json_annotation.dart';

import '../json_convertable.dart';
import 'expense_payer_parameters.dart';

part 'update_expense_parameters.g.dart';

@JsonSerializable()
class UpdateExpenseParameters extends JsonConvertable {
  final List<ExpensePayerParameters>? users;
  final String? description;

  UpdateExpenseParameters({
    this.users,
    this.description,
  });

  factory UpdateExpenseParameters.fromJson(Map<String, dynamic> json) =>
      _$UpdateExpenseParametersFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateExpenseParametersToJson(this);
}
