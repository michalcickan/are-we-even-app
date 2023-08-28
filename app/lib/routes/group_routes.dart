import 'package:areweeven/pages/add_group_member/add_group_member_page.dart';
import 'package:areweeven/pages/create_group/create_group_page.dart';
import 'package:areweeven/pages/group_detail/group_detail_page.dart';
import 'package:areweeven/pages/group_invitation_list/group_invitation_list_page.dart';
import 'package:areweeven/widgets/awe_dialog_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const groupRoutes = [
  TypedGoRoute<CreateGroupRoute>(path: "create-group"),
  TypedGoRoute<GroupDetailRoute>(path: "group-detail"),
  TypedGoRoute<AddGroupMemberRoute>(path: "add-group-member"),
];

class CreateGroupRoute extends GoRouteData {
  const CreateGroupRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return AWEDialogPage(builder: (_) => const CreateGroup());
  }
}

class GroupDetailRoute extends GoRouteData {
  final int groupId;

  const GroupDetailRoute(this.groupId);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return GroupDetailPage(groupId);
  }
}

class AddGroupMemberRoute extends GoRouteData {
  final int groupId;

  const AddGroupMemberRoute(
    this.groupId,
  );

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return AWEDialogPage(builder: (_) => AddGroupMemberPage(groupId));
  }
}

class GroupInvitationListRoute extends GoRouteData {
  const GroupInvitationListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const GroupInvitationListPage();
  }
}
