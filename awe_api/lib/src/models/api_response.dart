// @JsonSerializable(genericArgumentFactories: true)
import 'api_error.dart';

class APIResponse<T> {
  T? data;
  APIError? error;

  APIResponse({
    this.data,
    this.error,
  });

  factory APIResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) {
    final data = json["data"];
    if (data == null) {
      if (json["error"] != null) {
        return APIResponse(
          error: APIError.fromJson(
            json["error"],
          ),
        );
      }
      try {
        return APIResponse(data: fromJsonT(json));
      } catch (e) {
        return APIResponse(
          error: APIError(message: ""),
        );
      }
    }
    if (data is List) {
      final adjustedFromJsonT = fromJsonT as Function(List<dynamic>);
      return APIResponse(data: adjustedFromJsonT(data));
    }

    return data["error"] != null
        ? APIResponse(error: APIError.fromJson(data))
        : APIResponse(data: fromJsonT(data));
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    throw Exception(
      "Unimplemented. You should not use this object for params. This is designed only for decoding responses",
    );
  }
}
