import 'package:awe_api/src/interfaces/json_convertible.dart'; // Assuming you have JsonConvertable class defined in this file
import 'package:json_annotation/json_annotation.dart';

import 'expense_user.dart'; // Assuming you have ExpenseUser class defined in this file

part 'expense.g.dart';

@JsonSerializable()
class Expense extends JsonConvertible {
  final int id;
  final String description;
  final double totalAmount;
  final List<ExpenseUser>? participants;

  Expense({
    required this.id,
    required this.description,
    required this.totalAmount,
    this.participants,
  });

  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseToJson(this);
}
