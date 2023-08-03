import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(includeIfNull: false)
abstract class JsonConvertible {
  Map<String, dynamic> toJson() {
    throw Exception("unimplemented");
  }
}
