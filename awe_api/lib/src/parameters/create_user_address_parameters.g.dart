// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_address_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserAddressParameters _$CreateUserAddressParametersFromJson(
        Map<String, dynamic> json) =>
    CreateUserAddressParameters(
      city: json['city'] as String,
      zip: json['zip'] as String,
      street: json['street'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$CreateUserAddressParametersToJson(
        CreateUserAddressParameters instance) =>
    <String, dynamic>{
      'city': instance.city,
      'zip': instance.zip,
      'street': instance.street,
      'country': instance.country,
    };
