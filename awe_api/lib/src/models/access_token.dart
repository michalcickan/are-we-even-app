import 'package:awe_api/src/json_convertable.dart'; // Assuming you have JsonConvertable class defined in this file
import 'package:awe_api/src/utils/date_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'access_token.g.dart';

@JsonSerializable()
class AccessToken extends JsonConvertable {
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

  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);
}
