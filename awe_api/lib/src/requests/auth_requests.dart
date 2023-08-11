import 'package:awe_api/awe_api.dart';
import 'package:awe_api/src/endpoint.dart';

extension AuthRequests on AweAPIClient {
  Future<AccessToken> login(
    LoginParameters parameters,
    LoginType? loginType,
  ) =>
      post(
        Endpoint.login(loginType),
        AccessToken.fromJson,
        params: parameters,
      );

  Future<EmptyResponse> logout() => post(
        Endpoint.logout(),
        EmptyResponse.fromJson,
      );

  Future<AccessToken> register(RegistrationParameters parameters) => post(
        Endpoint.register(),
        AccessToken.fromJson,
        params: parameters,
      );
}
