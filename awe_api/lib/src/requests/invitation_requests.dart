import 'package:awe_api/awe_api.dart';
import 'package:awe_api/src/endpoint.dart';
import 'package:awe_api/src/extensions/list_for_serialization.dart';

extension InvitationRequests on AweAPIClient {
  Future<Group> resolveInvitation(
    int groupId,
    int invitationId,
    InvitationResolution resolution,
  ) =>
      post(
        Endpoint.groupsInvitationsResolution(
          groupId,
          resolution,
        ),
        Group.fromJson,
      );

  Future<List<Invitation>> getAllInvitations(AddExpenseParameters parameters) =>
      get(
        Endpoint.group(),
        <Invitation>[].fromJson(Invitation.fromJson),
        params: parameters,
      );

  Future<GenericResult> inviteUserToGroup(int userId, int groupId) => post(
        Endpoint.groupUser(
          groupId,
          userId,
        ),
        GenericResult.fromJson,
      );
}
