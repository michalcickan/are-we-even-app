import 'package:json_annotation/json_annotation.dart';

import '../json_convertable.dart';

part 'expense_payer_parameters.g.dart';

@JsonSerializable()
class ExpensePayerParameters extends JsonConvertable {
  final int id;
  final double paidAmount;
  final double dueAmount;

  ExpensePayerParameters({
    required this.id,
    required this.paidAmount,
    required this.dueAmount,
  });

  factory ExpensePayerParameters.fromJson(Map<String, dynamic> json) =>
      _$ExpensePayerParametersFromJson(json);

  Map<String, dynamic> toJson() => _$ExpensePayerParametersToJson(this);
}
