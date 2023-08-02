import 'package:awe_api/src/json_convertable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_group_parameters.g.dart';

@JsonSerializable()
class CreateGroupParameters extends JsonConvertable {
  final String name;

  CreateGroupParameters({
    required this.name,
  });

  factory CreateGroupParameters.fromJson(Map<String, dynamic> json) =>
      _$CreateGroupParametersFromJson(json);

  Map<String, dynamic> toJson() => _$CreateGroupParametersToJson(this);
}
