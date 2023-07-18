import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  String? zip;
  String? street;
  String? city;
  String? country;

  Address(
    this.zip,
    this.street,
    this.city,
    this.country,
  );

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
