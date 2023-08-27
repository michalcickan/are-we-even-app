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

  Future<Address> addAddress(CreateUserAddressParameters parameters) => post(
        Endpoint.userAddress(),
        Address.fromJson,
        params: parameters,
      );

  Future<PagedDataResponse<User>> searchUsers(
          UserSearchParameters parameters) =>
      getPagedData(
        Endpoint.usersSearch(),
        User.fromJson,
        params: parameters,
      );
}
