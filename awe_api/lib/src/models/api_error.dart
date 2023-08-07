import 'package:awe_api/src/interfaces/json_convertible.dart'; // Assuming you have JsonConvertable class defined in this file
import 'package:json_annotation/json_annotation.dart';

part 'api_error.g.dart';

@JsonSerializable()
class APIError extends JsonConvertible {
  final String message;

  APIError({
    required this.message,
  });

  factory APIError.fromJson(Map<String, dynamic> json) =>
      _$APIErrorFromJson(json);

  Map<String, dynamic> toJson() => _$APIErrorToJson(this);

  @override
  String toString() => message;
}
