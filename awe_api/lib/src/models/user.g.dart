// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['avatar'] as String?,
      json['email'] as String,
      json['name'] as String?,
      json['surname'] as String?,
      json['middleName'] as String?,
      (json['addresses'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('avatar', instance.avatar);
  val['email'] = instance.email;
  writeNotNull('name', instance.name);
  writeNotNull('surname', instance.surname);
  writeNotNull('middleName', instance.middleName);
  writeNotNull('addresses', instance.addresses);
  return val;
}
