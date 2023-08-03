import 'package:awe_api/src/interfaces/json_convertible.dart'; // Assuming you have JsonConvertable class defined in this file
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address extends JsonConvertible {
  final String street;
  final String zip;
  final String city;

  Address({
    required this.street,
    required this.zip,
    required this.city,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
