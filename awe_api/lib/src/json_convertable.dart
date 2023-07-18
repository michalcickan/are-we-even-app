import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(includeIfNull: false)
abstract class JsonConvertable {
  Map<String, dynamic> toJson() {
    throw Exception("unimplemented");
  }
}
