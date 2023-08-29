import 'package:awe_api/src/interfaces/json_convertible.dart'; // Assuming you have JsonConvertable class defined in this file
import 'package:awe_api/src/utils/date_utils.dart';
import 'package:json_annotation/json_annotation.dart';

import 'expense_user.dart'; // Assuming you have ExpenseUser class defined in this file

part 'expense.g.dart';

@JsonSerializable()
class Expense extends JsonConvertible {
  final int id;
  final String description;
  final double totalAmount;
  final List<ExpenseUser>? participants;
  @JsonKey(fromJson: dateTimeFromTimestamp)
  final DateTime? createdAt;

  Expense({
    required this.id,
    required this.description,
    required this.totalAmount,
    this.createdAt,
    this.participants,
  });

  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ExpenseToJson(this);
}
