import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum UserFilterColumn {
  name,
  middleName,
  surname,
  email,
}
