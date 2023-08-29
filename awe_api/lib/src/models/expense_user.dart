import 'package:json_annotation/json_annotation.dart';

part 'expense_user.g.dart';

@JsonSerializable()
class ExpenseUser {
  final int id;
  final String? name;
  final String email;
  final double paidAmount;
  final double dueAmount;

  ExpenseUser({
    required this.id,
    this.name,
    required this.email,
    required this.paidAmount,
    required this.dueAmount,
  });

  factory ExpenseUser.fromJson(Map<String, dynamic> json) =>
      _$ExpenseUserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ExpenseUserToJson(this);
}
