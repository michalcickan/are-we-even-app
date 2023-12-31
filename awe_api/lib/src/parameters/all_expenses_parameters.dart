import 'package:awe_api/src/interfaces/json_convertible.dart';
import 'package:json_annotation/json_annotation.dart';

import 'enums/sort_type.dart';

part 'all_expenses_parameters.g.dart'; // This is the generated file that will contain serialization code

@JsonSerializable()
class AllExpensesParameters extends JsonConvertible {
  final int? offset;
  final int? limit;
  @JsonKey(name: "sort")
  final SortType? sortType;

  AllExpensesParameters({
    this.sortType,
    this.offset,
    this.limit,
  });

  factory AllExpensesParameters.fromJson(Map<String, dynamic> json) =>
      _$AllExpensesParametersFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AllExpensesParametersToJson(this);
}
