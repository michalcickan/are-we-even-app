import 'package:awe_api/awe_api.dart';
import 'package:awe_api/src/endpoint.dart';

extension UserRequests on AweAPIClient {
  Future<User> getUser() => get(
        Endpoint.user(),
        User.fromJson,
      );

  Future<GenericResult> updateUser(UpdateUserParameters parameters) => put(
        Endpoint.user(),
        GenericResult.fromJson,
        params: parameters,
      );

  Future<GenericResult> addAddress(UpdateUserParameters parameters) => post(
        Endpoint.userAddress(),
        GenericResult.fromJson,
        params: parameters,
      );

  Future<GenericResult> searchUsers(UserSearchParameters parameters) => get(
        Endpoint.userAddress(),
        GenericResult.fromJson,
        params: parameters,
      );
}
