// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericResult _$GenericResultFromJson(Map<String, dynamic> json) =>
    GenericResult(
      json['message'] as String?,
      json['status'] as int?,
      dateTimeFromTimestamp(json['timestamp'] as String?),
    );

Map<String, dynamic> _$GenericResultToJson(GenericResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  writeNotNull('status', instance.status);
  writeNotNull('timestamp', instance.timestamp?.toIso8601String());
  return val;
}
