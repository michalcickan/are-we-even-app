import 'package:areweeven/extensions/go_router_context.dart';
import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:awe_api/awe_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'groups_list_providers.g.dart';

class GroupsListTexts {
  final String title;
  final String emptyDataPlaceholder;

  GroupsListTexts({
    required this.title,
    required this.emptyDataPlaceholder,
  });
}

@riverpod
GroupsListTexts groupsListTexts(GroupsListTextsRef ref) {
  final localizations = ref.watch(localizationProvider);
  return GroupsListTexts(
    title: localizations.groupsTabTitle,
    emptyDataPlaceholder: localizations.emptyGroupsPlaceholder,
  );
}

@riverpod
class GroupsListActions extends _$GroupsListActions
    with ProviderRouterContextMixin {
  @override
  void build() {}

  void didTapAdd() {}
}

@riverpod
Future<List<Group>> groupsListItems(GroupsListItemsRef ref) {
  return ref.watch(aweApiClientProvider).getAllGroups();
}
