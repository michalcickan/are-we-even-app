import 'dart:io';

import 'package:awe_api/awe_api.dart';
import 'package:awe_api/src/endpoint.dart';
import 'package:awe_api/src/extensions/map_dio.dart';
import 'package:awe_api/src/header_field.dart';
import 'package:dio/dio.dart';

final class AuthInterceptor extends InterceptorsWrapper {
  final AuthInfoManager authInfoManager;
  final AuthEvents? authEvents;
  final BaseOptions requestBaseOptions;
  final Set _needsDeviceId = {
    Endpoint.register().path,
    Endpoint.logout().path,
    Endpoint.login(null).path,
    Endpoint.token().path
  };
  TokensHolder? _tokensHolder;

  AuthInterceptor({
    required this.authInfoManager,
    required this.authEvents,
    required this.requestBaseOptions,
  });

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _tokensHolder ??= await authInfoManager.getTokens();
    if (_tokensHolder!.accessToken != null) {
      options.headers[HeaderField.authorization.value] =
          "Bearer ${_tokensHolder!.accessToken}";
    }
    if (_needsDeviceId.contains(options.uri.pathSegments[0])) {
      options.headers[HeaderField.deviceId.value] =
          await authInfoManager.deviceId;
    }
    return handler.next(options);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.statusCode == HttpStatus.noContent) {
      return handler.next(response);
    }
    if (response.realUri.pathSegments.contains(Endpoint.logout().path)) {
      setTokens(
        TokensHolder(null, null),
      );
      return handler.next(response);
    }
    final data = response.data?["data"];
    if (data == null || data is List) {
      return handler.next(response);
    }
    if (data["accessToken"] == null) {
      return handler.next(response);
    }
    final accessToken = AccessToken.fromJson(data);
    if (accessToken?.accessToken != null) {
      setTokens(accessToken.tokenHolder);
    }
    return handler.next(response);
  }

  @override
  Future onError(
    DioException e,
    ErrorInterceptorHandler handler,
  ) async {
    switch (e.response?.statusCode) {
      case 401:
        try {
          if (_tokensHolder?.refreshToken == null) {
            throw Exception("No refresh token");
          }
          final tempDio = Dio(requestBaseOptions);
          final newAccessToken = await fetchRefreshToken(tempDio);
          setTokens(
            TokensHolder(
              newAccessToken?.accessToken,
              newAccessToken?.refreshToken,
            ),
          );
          return handler.resolve(
            await tempDio.fetch(e.requestOptions),
          );
        } catch (e) {
          setTokens(
            TokensHolder(
              null,
              null,
            ),
          );
          authEvents?.onLoggedOut();
          break;
        }
        break;
      default:
        break;
    }
    return handler.next(e);
  }

  Future<AccessToken?> fetchRefreshToken(Dio dio) async {
    return dio
        .post(
          Endpoint.token().path,
          data: RefreshTokenParameters(
            refreshToken: _tokensHolder!.refreshToken!,
            clientId: "",
          ).toJson(),
          options: {
            HeaderField.deviceId.value: await authInfoManager.deviceId,
          }.dioOptions,
        )
        .then(
          (value) => APIResponse<AccessToken>.fromJson(
            value.data,
            AccessToken.fromJson as AccessToken Function(dynamic),
          ).data,
        );
  }

  void setTokens(TokensHolder holder) {
    _tokensHolder = holder;
    authInfoManager.saveAccessToken(holder.accessToken);
    authInfoManager.saveRefreshToken(holder.refreshToken);
  }
}

extension _TokenHolder on AccessToken {
  TokensHolder get tokenHolder => TokensHolder(
        accessToken,
        refreshToken,
      );
}
