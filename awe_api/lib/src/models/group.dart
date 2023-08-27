import 'package:awe_api/src/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

@JsonSerializable()
class Group {
  final String name;
  final int id;
  final bool? isDefault;
  final List<User>? members;

  Group({
    required this.name,
    required this.id,
    this.isDefault,
    this.members,
  });

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GroupToJson(this);
}
