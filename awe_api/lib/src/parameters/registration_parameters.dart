import 'package:awe_api/src/interfaces/json_convertible.dart';
import 'package:json_annotation/json_annotation.dart';

part 'registration_parameters.g.dart';

@JsonSerializable()
class RegistrationParameters extends JsonConvertible {
  final String password;
  final String email;

  RegistrationParameters({
    required this.password,
    required this.email,
  });

  factory RegistrationParameters.fromJson(Map<String, dynamic> json) =>
      _$RegistrationParametersFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RegistrationParametersToJson(this);
}
