// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Expense _$ExpenseFromJson(Map<String, dynamic> json) => Expense(
      id: json['id'] as int,
      description: json['description'] as String,
      totalAmount: (json['totalAmount'] as num).toDouble(),
      createdAt: dateTimeFromTimestamp(json['createdAt'] as int?),
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => ExpenseUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExpenseToJson(Expense instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'description': instance.description,
    'totalAmount': instance.totalAmount,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('participants', instance.participants);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  return val;
}
