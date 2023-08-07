// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshToken _$RefreshTokenFromJson(Map<String, dynamic> json) => RefreshToken(
      id: json['id'] as int,
      refreshToken: json['refreshToken'] as String,
      expiryDate: dateTimeFromTimestamp(json['expiryDate'] as int?),
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$RefreshTokenToJson(RefreshToken instance) =>
    <String, dynamic>{
      'id': instance.id,
      'refreshToken': instance.refreshToken,
      'expiryDate': instance.expiryDate.toIso8601String(),
      'userId': instance.userId,
    };
