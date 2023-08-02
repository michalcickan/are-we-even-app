// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginParameters _$LoginParametersFromJson(Map<String, dynamic> json) =>
    LoginParameters(
      idToken: json['idToken'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LoginParametersToJson(LoginParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('idToken', instance.idToken);
  writeNotNull('password', instance.password);
  return val;
}
