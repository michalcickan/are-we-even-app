import 'package:awe_api/src/utils/date_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generic_result.g.dart';

@JsonSerializable()
class GenericResult {
  String? message;
  int? status;
  @JsonKey(fromJson: dateTimeFromTimestamp)
  DateTime? timestamp;

  GenericResult(
    this.message,
    this.status,
    this.timestamp,
  );

  factory GenericResult.fromJson(Map<String, dynamic> json) =>
      _$GenericResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GenericResultToJson(this);
}
