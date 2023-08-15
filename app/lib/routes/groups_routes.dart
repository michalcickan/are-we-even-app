import 'package:areweeven/pages/create_group/create_group_page.dart';
import 'package:areweeven/widgets/awe_dialog_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const groupsRoutes = [
  TypedGoRoute<CreateGroupRoute>(path: "create-group"),
];

class CreateGroupRoute extends GoRouteData {
  const CreateGroupRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return AWEDialogPage(builder: (_) => const CreateGroup());
  }
}
