import 'package:awe_api/awe_api.dart';
import 'package:awe_api/src/endpoint.dart';

extension UserRequests on AweAPIClient {
  Future<User> getUser() => get(
        Endpoint.user(),
        User.fromJson,
      );

  Future<User> updateUser(UpdateUserParameters parameters) => put(
        Endpoint.user(),
        User.fromJson,
        params: parameters,
      );

  Future<Address> addAddress(UpdateUserParameters parameters) => post(
        Endpoint.userAddress(),
        Address.fromJson,
        params: parameters,
      );

  Future<GenericResult> searchUsers(UserSearchParameters parameters) => get(
        Endpoint.userAddress(),
        GenericResult.fromJson,
        params: parameters,
      );
}
