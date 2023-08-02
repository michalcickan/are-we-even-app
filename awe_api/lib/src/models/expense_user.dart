import 'package:json_annotation/json_annotation.dart';

part 'expense_user.g.dart';

@JsonSerializable()
class ExpenseUser {
  final int id;
  final String? name;
  final double paidAmount;
  final double dueAmount;

  ExpenseUser({
    required this.id,
    this.name,
    required this.paidAmount,
    required this.dueAmount,
  });

  factory ExpenseUser.fromJson(Map<String, dynamic> json) =>
      _$ExpenseUserFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseUserToJson(this);
}
