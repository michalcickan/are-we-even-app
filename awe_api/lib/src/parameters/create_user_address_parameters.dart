import 'package:awe_api/src/interfaces/json_convertible.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_user_address_parameters.g.dart';

@JsonSerializable()
class CreateUserAddressParameters extends JsonConvertible {
  final String city;
  final String zip;
  final String street;
  final String country;

  CreateUserAddressParameters({
    required this.city,
    required this.zip,
    required this.street,
    required this.country,
  });

  factory CreateUserAddressParameters.fromJson(Map<String, dynamic> json) =>
      _$CreateUserAddressParametersFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateUserAddressParametersToJson(this);
}
