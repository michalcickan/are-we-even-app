// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      json['zip'] as String?,
      json['street'] as String?,
      json['city'] as String?,
      json['country'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('zip', instance.zip);
  writeNotNull('street', instance.street);
  writeNotNull('city', instance.city);
  writeNotNull('country', instance.country);
  return val;
}
