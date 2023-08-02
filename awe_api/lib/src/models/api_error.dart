import 'package:awe_api/src/json_convertable.dart'; // Assuming you have JsonConvertable class defined in this file
import 'package:json_annotation/json_annotation.dart';

part 'api_error.g.dart';

@JsonSerializable()
class APIError extends JsonConvertable {
  final String message;

  APIError({
    required this.message,
  });

  factory APIError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);
}
