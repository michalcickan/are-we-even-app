import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'debt.g.dart'; // This will be generated by json_serializable

@JsonSerializable()
class Debt {
  final int id;
  final User debtor;
  final User creditor;
  final double amountOwed;

  Debt({
    required this.id,
    required this.debtor,
    required this.creditor,
    required this.amountOwed,
  });

  factory Debt.fromJson(Map<String, dynamic> json) => _$DebtFromJson(json);

  Map<String, dynamic> toJson() => _$DebtToJson(this);
}
