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

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    int? id,
    String? name,
    String? middleName,
    String? surname,
    List<Address>? addresses,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      middleName: middleName ?? this.middleName,
      surname: surname ?? this.surname,
      addresses: addresses ?? this.addresses,
      email: email ?? this.email,
    );
  }
}
