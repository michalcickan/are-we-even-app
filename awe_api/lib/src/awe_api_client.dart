import 'dart:io';

import 'package:awe_api/awe_api.dart';
import 'package:awe_api/src/extensions/map_dio.dart';
import 'package:awe_api/src/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';

import 'endpoint.dart';

typedef Parser<T> = T Function(Map<String, dynamic> json);

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
      validateStatus: validateStatus,
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
}

extension Methods on AweAPIClient {
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
          .then(parseResponse(parser))
          .then(handleResponse);

  Future<PagedDataResponse<T>> getPagedData<T>(
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
          .then(parsePagedResponse(parser))
          .then((val) => checkForError(val) as PagedDataResponse<T>);

  Future<T> post<T>(
    Endpoint endpoint,
    Parser<T> parser, {
    JsonConvertible? params,
    Map<String, dynamic>? additionalHeaders,
  }) =>
      _dio
          .post(
            endpoint.path,
            data: params?.toJson(),
            options: additionalHeaders?.dioOptions,
          )
          .then(parseResponse(parser))
          .then(handleResponse);

  Future<T> put<T>(
    Endpoint endpoint,
    Parser<T> parser, {
    JsonConvertible? params,
    Map<String, dynamic>? additionalHeaders,
  }) =>
      _dio
          .put(
            endpoint.path,
            data: params?.toJson(),
            options: additionalHeaders?.dioOptions,
          )
          .then(parseResponse(parser))
          .then(handleResponse);

  Future<T> delete<T>(
    Endpoint endpoint,
    Parser<T> parser, {
    JsonConvertible? data,
    Map<String, dynamic>? additionalHeaders,
  }) =>
      _dio
          .delete(
            endpoint.path,
            data: data?.toJson(),
            options: additionalHeaders?.dioOptions,
          )
          .then(parseResponse(parser))
          .then(handleResponse);
}

extension _Handling on AweAPIClient {
  DataResponse<T> checkForError<T>(DataResponse<T> response) {
    if (response.error != null) {
      throw (response.error ?? Exception("Something went wrong"));
    }
    return response;
  }

  T handleResponse<T>(DataResponse<T> response) {
    checkForError(response);
    final data = response.data;
    return data!;
  }

  PagedDataResponse<T> Function(Response<dynamic>) parsePagedResponse<T>(
          Parser<T> parser) =>
      (value) {
        return PagedDataResponse<T>.fromJson(
          value.statusCode == HttpStatus.noContent ? {} : value.data,
          parser,
        );
      };

  DataResponse<T> Function(Response<dynamic>) parseResponse<T>(
          Parser<T> parser) =>
      (value) {
        return APIResponse<T>.fromJson(
          value.statusCode == HttpStatus.noContent ? {} : value.data,
          parser,
        );
      };

  bool validateStatus(int? status) {
    return status != 401 && status != 500;
  }
}
