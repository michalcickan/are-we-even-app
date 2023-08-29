import 'package:areweeven/pages/add_group_member/add_group_member_page.dart';
import 'package:areweeven/pages/create_group/create_group_page.dart';
import 'package:areweeven/pages/group_detail/group_detail_page.dart';
import 'package:areweeven/pages/group_invitation_list/group_invitation_list_page.dart';
import 'package:areweeven/routes/routes_global_keys.dart';
import 'package:areweeven/widgets/awe_dialog_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const shelledGroupRoutes = [
  TypedGoRoute<GroupDetailRoute>(path: "group-detail"),
];

const groupRoutes = [
  TypedGoRoute<CreateGroupRoute>(path: "create-group"),
  TypedGoRoute<AddGroupMemberRoute>(path: "add-group-member"),
];

class CreateGroupRoute extends GoRouteData {
  const CreateGroupRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return AWEDialogPage(
      key: state.pageKey,
      builder: (_) => const CreateGroup(),
    );
  }
}

class GroupDetailRoute extends GoRouteData {
  /*
  It crashes on parsing query parameter `groupId` when a user switches back from other tab,
  but it the groupId value is there during build function.

  // https://github.com/flutter/flutter/issues/129878
   */

  final int? groupId;

  const GroupDetailRoute(this.groupId);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return GroupDetailPage(groupId!);
  }
}

class AddGroupMemberRoute extends GoRouteData {
  final int groupId;

  const AddGroupMemberRoute(
    this.groupId,
  );

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

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
