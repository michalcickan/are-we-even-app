import 'dart:io';

import 'package:awe_api/src/endpoint.dart';
import 'package:awe_api/src/json_convertable.dart';
import 'package:awe_api/src/models/api_response.dart';
import 'package:awe_api/src/models/generic_result.dart';
import 'package:dio/dio.dart';

import 'global_error_handler.dart';
import 'header_field.dart';

/// Checks if you are awesome. Spoiler: you are.
class AweAPI {
  late final Dio _dio;
  final String apiVersion;

  AweAPI({
    required String baseUrl,
    required this.apiVersion,
    String? accessToken,
    Dio? dio,
    int timeoutInSeconds = 30,
    Interceptor? logger,
    GlobalErrorHandler? globalErrorHandler,
  }) {
    _dio = dio ?? Dio();
    _dio.options = BaseOptions(
      baseUrl: "$baseUrl/api/${apiVersion}/",
      connectTimeout: Duration(seconds: timeoutInSeconds),
      responseType: ResponseType.json,
      contentType: ContentType.json.toString(),
      headers: {
        "accept": ContentType.json.toString(),
      },
      receiveDataWhenStatusError: true,
      validateStatus: makeValidateStatus(globalErrorHandler),
    );
    if (logger != null) {
      _dio.interceptors.add(logger!);
    }
    _accessToken = accessToken;
  }

  set _accessToken(String? newAccessToken) {
    newAccessToken != null
        ? _dio.options.headers[HeaderField.authorization.value] =
            "Bearer ${newAccessToken!}"
        : _dio.options.headers.remove(HeaderField.authorization.value);
  }

  Future<T> get<T>(
    Endpoint endpoint,
    T Function(Map<String, dynamic> json) parser, {
    JsonConvertable? params,
    Map<String, dynamic>? additionalHeaders,
  }) =>
      _dio
          .get(
            endpoint.path,
            data: null,
            options: _makeOptions(additionalHeaders),
            queryParameters: params?.toJson(),
          )
          .then((value) => APIResponse<T>.fromJson(value.data, parser))
          .then(handleResponse);

  Future<T> post<T>(
    Endpoint endpoint,
    T Function(Map<String, dynamic> json) parser, {
    JsonConvertable? params,
    Map<String, dynamic>? additionalHeaders,
  }) =>
      _dio
          .post(
            endpoint.path,
            data: params?.toJson(),
            options: _makeOptions(additionalHeaders),
          )
          .then((value) => APIResponse<T>.fromJson(value.data, parser))
          .then(handleResponse);

  Future<T> put<T>(
    Endpoint endpoint,
    T Function(Map<String, dynamic> json) parser, {
    JsonConvertable? params,
    Map<String, dynamic>? additionalHeaders,
  }) =>
      _dio
          .post(
            endpoint.path,
            data: params?.toJson(),
            options: _makeOptions(additionalHeaders),
          )
          .then((value) => APIResponse<T>.fromJson(value.data, parser))
          .then(handleResponse);

  Future<T> delete<T>(
    Endpoint endpoint,
    T Function(Map<String, dynamic> json) parser, {
    JsonConvertable? data,
    Map<String, dynamic>? additionalHeaders,
  }) =>
      _dio
          .delete(
            endpoint.path,
            data: data?.toJson(),
            options: _makeOptions(additionalHeaders),
          )
          .then((value) => APIResponse<T>.fromJson(value.data, parser))
          .then(handleResponse);

  T handleResponse<T>(APIResponse<T> response) {
    final data = response.data;
    if (data == null) {
      throw (response.error ?? Exception("Something went wrong"));
    }
    if (data is TokenResponse && data.accessToken != null) {
      _accessToken = data.accessToken;
    }
    return data!;
  }

  Future<GenericResult> logout() {
    _accessToken = null;
    return Future.value(
      GenericResult("ok", 200, DateTime.now()),
    );
  }

  Options? _makeOptions(Map<String, dynamic>? additionalHeaders) {
    if (additionalHeaders == null) {
      return null;
    }
    return Options(headers: additionalHeaders!);
  }

  ValidateStatus makeValidateStatus(GlobalErrorHandler? errorHandler) {
    return (int? statusCode) {
      switch (statusCode ?? 0) {
        case 401:
          // why we don't have a mechanism for refreshing token?
          _accessToken = null;
          errorHandler?.onLoggedOut();
          break;
        case 410:
          errorHandler?.onForceUpdate();
          break;
      }
      return true;
    };
  }
}
