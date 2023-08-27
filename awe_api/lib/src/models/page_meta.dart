import 'package:json_annotation/json_annotation.dart';

part 'page_meta.g.dart';

@JsonSerializable()
class PageMeta {
  int totalCount;
  int offset;

  PageMeta({
    required this.totalCount,
    required this.offset,
  });

  factory PageMeta.fromJson(Map<String, dynamic> json) =>
      _$PageMetaFromJson(json);

  Map<String, dynamic> toJson() => _$PageMetaToJson(this);
}
