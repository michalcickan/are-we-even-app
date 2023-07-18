import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? avatar;
  String email;
  String? name;
  String? surname;

  // @JsonKey(name: "middle_name")
  String? middleName;
  List<Address>? addresses;

  User(
    this.avatar,
    this.email,
    this.name,
    this.surname,
    this.middleName,
    this.addresses,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
