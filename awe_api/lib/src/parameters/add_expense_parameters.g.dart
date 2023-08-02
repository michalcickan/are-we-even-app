// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_expense_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddExpenseParameters _$AddExpenseParametersFromJson(
        Map<String, dynamic> json) =>
    AddExpenseParameters(
      users: (json['users'] as List<dynamic>)
          .map(
              (e) => ExpensePayerParameters.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$AddExpenseParametersToJson(
        AddExpenseParameters instance) =>
    <String, dynamic>{
      'users': instance.users,
      'description': instance.description,
    };
