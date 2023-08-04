import 'package:awe_api/src/interfaces/json_convertible.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_parameters.g.dart';

@JsonSerializable()
class LoginParameters extends JsonConvertible {
  final String? idToken;
  final String? email;
  final String? password;

  LoginParameters({
    this.idToken,
    this.email,
    this.password,
  });

  factory LoginParameters.fromJson(Map<String, dynamic> json) =>
      _$LoginParametersFromJson(json);

  Map<String, dynamic> toJson() => _$LoginParametersToJson(this);
}
