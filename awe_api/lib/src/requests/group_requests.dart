import 'package:awe_api/awe_api.dart';
import 'package:awe_api/src/endpoint.dart';
import 'package:awe_api/src/extensions/list_for_serialization.dart';

extension GroupRequests on AweAPIClient {
  Future<Group> createGroup(CreateGroupParameters parameters) => post(
        Endpoint.group(),
        Group.fromJson,
        params: parameters,
      );

  Future<List<Group>> getAllGroups(int groupId) => get(
        Endpoint.group(),
        <Group>[].fromJson(Group.fromJson),
      );
}
