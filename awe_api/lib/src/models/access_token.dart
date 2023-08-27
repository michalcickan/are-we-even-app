import 'package:awe_api/src/interfaces/json_convertible.dart'; // Assuming you have JsonConvertable class defined in this file
import 'package:awe_api/src/utils/date_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'access_token.g.dart';

@JsonSerializable()
class AccessToken extends JsonConvertible {
  final String accessToken;
  final String refreshToken;

  @JsonKey(fromJson: dateTimeFromTimestamp)
  final DateTime expiryDate;

  AccessToken({
    required this.accessToken,
    required this.refreshToken,
    required this.expiryDate,
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenFromJson(json);

  @override
  @override
  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);
}
