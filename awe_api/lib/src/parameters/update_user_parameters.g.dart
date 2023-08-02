// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserParameters _$UpdateUserParametersFromJson(
        Map<String, dynamic> json) =>
    UpdateUserParameters(
      email: json['email'] as String?,
      name: json['name'] as String?,
      middleName: json['middleName'] as String?,
      surname: json['surname'] as String?,
    );

Map<String, dynamic> _$UpdateUserParametersToJson(
    UpdateUserParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('name', instance.name);
  writeNotNull('middleName', instance.middleName);
  writeNotNull('surname', instance.surname);
  return val;
}
