// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseUser _$ExpenseUserFromJson(Map<String, dynamic> json) => ExpenseUser(
      id: json['id'] as int,
      name: json['name'] as String?,
      paidAmount: (json['paidAmount'] as num).toDouble(),
      dueAmount: (json['dueAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$ExpenseUserToJson(ExpenseUser instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  val['paidAmount'] = instance.paidAmount;
  val['dueAmount'] = instance.dueAmount;
  return val;
}
