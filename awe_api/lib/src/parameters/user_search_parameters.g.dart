// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_search_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSearchParameters _$UserSearchParametersFromJson(
        Map<String, dynamic> json) =>
    UserSearchParameters(
      column: $enumDecodeNullable(_$UserFilterColumnEnumMap, json['column']),
      query: json['query'] as String,
      limit: json['limit'] as int,
      offset: json['offset'] as int,
    );

Map<String, dynamic> _$UserSearchParametersToJson(
    UserSearchParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('column', _$UserFilterColumnEnumMap[instance.column]);
  val['query'] = instance.query;
  val['offset'] = instance.offset;
  val['limit'] = instance.limit;
  return val;
}

const _$UserFilterColumnEnumMap = {
  UserFilterColumn.name: 'name',
  UserFilterColumn.middleName: 'middleName',
  UserFilterColumn.surname: 'surname',
  UserFilterColumn.email: 'email',
};
