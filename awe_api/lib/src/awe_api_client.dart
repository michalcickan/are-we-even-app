import 'dart:io';

import 'package:awe_api/awe_api.dart';
import 'package:awe_api/src/endpoint.dart';
import 'package:awe_api/src/extensions/map_dio.dart';
import 'package:awe_api/src/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';

/// Checks if you are awesome. Spoiler: you are.
final class AweAPIClient {
  late final Dio _dio;

  AweAPIClient({
    required String baseUrl,
    required AuthInfoManager authInfoManager,
    Dio? dio,
    int timeoutInSeconds = 30,
    Interceptor? logger,
    AuthEvents? authEvents,
  }) {
    _dio = dio ?? Dio();
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: timeoutInSeconds),
      responseType: ResponseType.json,
      contentType: ContentType.json.toString(),
      headers: {
        "accept": ContentType.json.toString(),
      },
      receiveDataWhenStatusError: true,
      validateStatus: _validateStatus,
    );
    if (logger != null) {
      _dio.interceptors.add(logger!);
    }
    _dio.interceptors.add(
      AuthInterceptor(
        authEvents: authEvents,
        authInfoManager: authInfoManager,
        requestBaseOptions: _dio.options,
      ),
    );
  }

  Future<T> get<T>(
    Endpoint endpoint,
    T Function(Map<String, dynamic> json) parser, {
    JsonConvertible? params,
    Map<String, dynamic>? additionalHeaders,
  }) =>
      _dio
          .get(
            endpoint.path,
            data: null,
            options: additionalHeaders?.dioOptions,
            queryParameters: params?.toJson(),
          )
          .then((value) => APIResponse<T>.fromJson(value.data, parser))
          .then(handleResponse);

  Future<T> post<T>(
    Endpoint endpoint,
    T Function(Map<String, dynamic> json) parser, {
    JsonConvertible? params,
    Map<String, dynamic>? additionalHeaders,
  }) =>
      _dio
          .post(
            endpoint.path,
            data: params?.toJson(),
            options: additionalHeaders?.dioOptions,
          )
          .then((value) => APIResponse<T>.fromJson(
              value.statusCode == HttpStatus.noContent ? {} : value.data,
              parser))
          .then(handleResponse);

  Future<T> put<T>(
    Endpoint endpoint,
    T Function(Map<String, dynamic> json) parser, {
    JsonConvertible? params,
    Map<String, dynamic>? additionalHeaders,
  }) =>
      _dio
          .put(
            endpoint.path,
            data: params?.toJson(),
            options: additionalHeaders?.dioOptions,
          )
          .then((value) => APIResponse<T>.fromJson(value.data, parser))
          .then(handleResponse);

  Future<T> delete<T>(
    Endpoint endpoint,
    T Function(Map<String, dynamic> json) parser, {
    JsonConvertible? data,
    Map<String, dynamic>? additionalHeaders,
  }) =>
      _dio
          .delete(
            endpoint.path,
            data: data?.toJson(),
            options: additionalHeaders?.dioOptions,
          )
          .then((value) => APIResponse<T>.fromJson(value.data, parser))
          .then(handleResponse);

  T handleResponse<T>(APIResponse<T> response) {
    final data = response.data;
    if (data == null) {
      throw (response.error ?? Exception("Something went wrong"));
    }
    return data!;
  }

  bool _validateStatus(int? status) {
    return status != 401;
  }
}
