import 'package:awe_api/src/awe_api_client.dart';
import 'package:awe_api/src/endpoint.dart';
import 'package:awe_api/src/models/access_token.dart';
import 'package:awe_api/src/models/empty_response.dart';
import 'package:awe_api/src/parameters/enums/login_type.dart';
import 'package:awe_api/src/parameters/login_parameters.dart';
import 'package:awe_api/src/parameters/registration_parameters.dart';

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
