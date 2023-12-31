import 'package:awe_api/src/interfaces/json_convertible.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_parameters.g.dart';

@JsonSerializable()
class RefreshTokenParameters extends JsonConvertible {
  final String refreshToken;
  final String clientId;

  RefreshTokenParameters({
    required this.refreshToken,
    required this.clientId,
  });

  factory RefreshTokenParameters.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenParametersFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RefreshTokenParametersToJson(this);
}
