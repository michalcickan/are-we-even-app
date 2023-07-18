// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorDetail _$ApiErrorDetailFromJson(Map<String, dynamic> json) =>
    ApiErrorDetail(
      json['message'] as String,
      json['field'] as String?,
    );

Map<String, dynamic> _$ApiErrorDetailToJson(ApiErrorDetail instance) {
  final val = <String, dynamic>{
    'message': instance.message,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('field', instance.field);
  return val;
}

ApiError _$ApiErrorFromJson(Map<String, dynamic> json) => ApiError(
      json['url'] as String?,
      json['status'] as int,
      (json['errors'] as List<dynamic>)
          .map((e) => ApiErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiErrorToJson(ApiError instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  val['status'] = instance.status;
  val['errors'] = instance.details;
  return val;
}
