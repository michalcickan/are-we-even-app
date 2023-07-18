import 'package:json_annotation/json_annotation.dart';

part 'api_error.g.dart';

@JsonSerializable()
class ApiErrorDetail {
  final String message;
  final String? field;

  const ApiErrorDetail(this.message, this.field);

  factory ApiErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ApiErrorDetailToJson(this);

  @override
  String toString() {
    return message;
  }
}

@JsonSerializable()
class ApiError {
  final String? url;
  final int status;
  @JsonKey(name: "errors")
  final List<ApiErrorDetail> details;

  const ApiError(this.url, this.status, this.details);

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);
  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);

  @override
  String toString() {
    return details.map((e) => e.toString()).join("\n");
  }
}
