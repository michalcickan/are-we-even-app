import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String? name;
  final String? middleName;
  final String? surname;
  final List<Address>? addresses;
  final String email;

  User({
    required this.id,
    this.name,
    this.middleName,
    this.surname,
    this.addresses,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
