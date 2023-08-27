import 'package:awe_api/src/interfaces/json_convertible.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_group_parameters.g.dart';

@JsonSerializable()
class CreateGroupParameters extends JsonConvertible {
  final String name;

  CreateGroupParameters({
    required this.name,
  });

  factory CreateGroupParameters.fromJson(Map<String, dynamic> json) =>
      _$CreateGroupParametersFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateGroupParametersToJson(this);
}
