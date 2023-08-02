import 'package:awe_api/src/utils/date_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token.g.dart';

@JsonSerializable()
class RefreshToken {
  final int id;
  final String refreshToken;

  @JsonKey(fromJson: dateTimeFromTimestamp)
  final DateTime expiryDate;

  final int userId;

  RefreshToken({
    required this.id,
    required this.refreshToken,
    required this.expiryDate,
    required this.userId,
  });

  factory RefreshToken.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenToJson(this);
}
