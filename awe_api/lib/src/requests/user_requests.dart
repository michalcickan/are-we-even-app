import 'package:awe_api/awe_api.dart';
import 'package:awe_api/src/endpoint.dart';
import 'package:awe_api/src/extensions/list_for_serialization.dart';

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

  Future<Address> addAddress(CreateUserAddressParameters parameters) => post(
        Endpoint.userAddress(),
        Address.fromJson,
        params: parameters,
      );

  Future<List<User>> searchUsers(UserSearchParameters parameters) => get(
        Endpoint.usersSearch(),
        <User>[].fromJson(User.fromJson),
        params: parameters,
      );
}
