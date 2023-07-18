// @JsonSerializable(genericArgumentFactories: true)
import 'api_error.dart';

class APIResponse<T> {
  T? data;
  ApiError? error;

  APIResponse({
    this.data,
    this.error,
  });

  factory APIResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) {
    final data = json["data"] as Map<String, dynamic>?;
    if (data == null) {
      if (json["error"] != null) {
        return APIResponse(
          error: ApiError.fromJson(json["error"]),
        );
      }
      try {
        return APIResponse(data: fromJsonT(json));
      } catch (e) {
        return APIResponse(
            error: const ApiError(
          null,
          422,
          [],
        ));
      }
    }
    return data["error"] != null
        ? APIResponse(error: ApiError.fromJson(data))
        : APIResponse(data: fromJsonT(data));
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    throw Exception(
      "Unimplemented. You should not use this object for params. This is designed only for decoding responses",
    );
  }
}
