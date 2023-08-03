import 'package:awe_api/src/interfaces/json_convertible.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user_filter_column.dart';

part 'user_search_parameters.g.dart';

@JsonSerializable()
class UserSearchParameters extends JsonConvertible {
  final UserFilterColumn? column;
  final String query;

  UserSearchParameters({
    this.column,
    required this.query,
  });

  factory UserSearchParameters.fromJson(Map<String, dynamic> json) =>
      _$UserSearchParametersFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserSearchParametersToJson(this);
}