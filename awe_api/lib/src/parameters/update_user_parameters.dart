import 'package:awe_api/src/interfaces/json_convertible.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_user_parameters.g.dart';

@JsonSerializable()
class UpdateUserParameters extends JsonConvertible {
  final String? email;
  final String? name;
  final String? middleName;
  final String? surname;

  UpdateUserParameters({
    this.email,
    this.name,
    this.middleName,
    this.surname,
  });

  factory UpdateUserParameters.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserParametersFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserParametersToJson(this);
}
