import 'package:awe_api/awe_api.dart';
import 'package:awe_api/src/endpoint.dart';
import 'package:awe_api/src/header_field.dart';
import 'package:awe_api/src/models/empty_response.dart';

extension AuthRequests on AweAPIClient {
  Future<AccessToken> login(
    LoginParameters parameters,
    LoginType? loginType,
    String deviceId,
  ) =>
      post(
        Endpoint.login(loginType),
        AccessToken.fromJson,
        params: parameters,
        additionalHeaders: deviceId.deviceIdHeader,
      );

  Future<EmptyResponse> logout(
    String deviceId,
  ) =>
      post(
        Endpoint.logout(),
        EmptyResponse.fromJson,
        additionalHeaders: deviceId.deviceIdHeader,
      );

  Future<AccessToken> register(
    RegistrationParameters parameters,
    String deviceId,
  ) =>
      post(
        Endpoint.register(),
        AccessToken.fromJson,
        params: parameters,
        additionalHeaders: deviceId.deviceIdHeader,
      );
}

extension _AuthHeaders on String {
  Map<String, dynamic> get deviceIdHeader {
    return {HeaderField.deviceId.value: this};
  }
}
