import 'package:awe_api/awe_api.dart';
import 'package:awe_api/src/extensions/list_for_serialization.dart';

class PagedDataResponse<T> extends DataResponse<List<T>> {
  final PageMeta? meta;

  PagedDataResponse({
    this.meta,
    super.data,
    super.error,
  });

  factory PagedDataResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) {
    if (json["error"] != null) {
      return PagedDataResponse(error: APIError.fromJson(json["error"]));
    }
    final parser = <T>[].fromJson(fromJsonT);
    final meta = json["meta"];
    return PagedDataResponse(
      data: parser(json["data"]),
      meta: meta != null ? PageMeta.fromJson(meta) : null,
    );
  }
}
