// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_expense_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateExpenseParameters _$UpdateExpenseParametersFromJson(
        Map<String, dynamic> json) =>
    UpdateExpenseParameters(
      users: (json['users'] as List<dynamic>?)
          ?.map(
              (e) => ExpensePayerParameters.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$UpdateExpenseParametersToJson(
    UpdateExpenseParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('users', instance.users);
  writeNotNull('description', instance.description);
  return val;
}
