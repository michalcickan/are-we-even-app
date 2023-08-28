// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_expenses_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllExpensesParameters _$AllExpensesParametersFromJson(
        Map<String, dynamic> json) =>
    AllExpensesParameters(
      sortType: $enumDecodeNullable(_$SortTypeEnumMap, json['sort']),
      offset: json['offset'] as int?,
      limit: json['limit'] as int?,
    );

Map<String, dynamic> _$AllExpensesParametersToJson(
    AllExpensesParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('offset', instance.offset);
  writeNotNull('limit', instance.limit);
  writeNotNull('sort', _$SortTypeEnumMap[instance.sortType]);
  return val;
}

const _$SortTypeEnumMap = {
  SortType.asc: 'asc',
  SortType.desc: 'desc',
};
