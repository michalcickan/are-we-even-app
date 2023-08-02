// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenParameters _$RefreshTokenParametersFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenParameters(
      refreshToken: json['refreshToken'] as String,
      clientId: json['clientId'] as String,
    );

Map<String, dynamic> _$RefreshTokenParametersToJson(
        RefreshTokenParameters instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
      'clientId': instance.clientId,
    };
