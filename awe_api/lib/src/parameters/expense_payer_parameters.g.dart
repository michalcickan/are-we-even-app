// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_payer_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpensePayerParameters _$ExpensePayerParametersFromJson(
        Map<String, dynamic> json) =>
    ExpensePayerParameters(
      id: json['id'] as int,
      paidAmount: (json['paidAmount'] as num).toDouble(),
      dueAmount: (json['dueAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$ExpensePayerParametersToJson(
        ExpensePayerParameters instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paidAmount': instance.paidAmount,
      'dueAmount': instance.dueAmount,
    };
