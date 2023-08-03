import 'package:awe_api/src/endpoint.dart';
import 'package:awe_api/src/header_field.dart';
import 'package:awe_api/src/interfaces/auth_events.dart';
import 'package:awe_api/src/interfaces/tokens_provider.dart';
import 'package:awe_api/src/models/access_token.dart';
import 'package:awe_api/src/models/api_response.dart';
import 'package:awe_api/src/parameters/refresh_token_parameters.dart';
import 'package:awe_api/src/tokens_holder.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends InterceptorsWrapper {
  final TokensStorage tokensStorage;
  final AuthEvents? authEvents;
  final BaseOptions requestBaseOptions;
  TokensHolder? _tokensHolder;

  AuthInterceptor({
    required this.tokensStorage,
    required this.authEvents,
    required this.requestBaseOptions,
  });

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _tokensHolder ??= await tokensStorage.getTokens();
    if (_tokensHolder!.accessToken != null) {
      options.headers[HeaderField.authorization.value] =
          "Bearer ${_tokensHolder!.accessToken}";
    }
    return handler.next(options);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    final data = response.data;
    if (data is AccessToken && data.accessToken != null) {
      setTokens(data.tokenHolder);
    }
    handler.next(response);
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

  Future<AccessToken?> fetchRefreshToken(Dio dio) {
    return dio
        .post(
          Endpoint.token().path,
          data: RefreshTokenParameters(
            refreshToken: _tokensHolder!.refreshToken!,
            clientId: "",
          ).toJson(),
        )
        .then(
          (value) => APIResponse<AccessToken>.fromJson(
            value.data,
            AccessToken.fromJson,
          ).data,
        );
  }

  void setTokens(TokensHolder holder) {
    _tokensHolder = holder;
    tokensStorage.saveAccessToken(holder.accessToken);
    tokensStorage.saveRefreshToken(holder.refreshToken);
  }
}

extension _TokenHolder on AccessToken {
  TokensHolder get tokenHolder => TokensHolder(
        accessToken,
        refreshToken,
      );
}
