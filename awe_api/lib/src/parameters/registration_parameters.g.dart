// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationParameters _$RegistrationParametersFromJson(
        Map<String, dynamic> json) =>
    RegistrationParameters(
      password: json['password'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$RegistrationParametersToJson(
        RegistrationParameters instance) =>
    <String, dynamic>{
      'password': instance.password,
      'email': instance.email,
    };
