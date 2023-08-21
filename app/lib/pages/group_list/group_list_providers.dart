import 'package:areweeven/gen/app_localizations.dart';
import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:areweeven/global_providers/current_group_provider.dart';
import 'package:areweeven/global_providers/global_error_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/routes/groups_routes.dart';
import 'package:areweeven/routes/routes.dart';
import 'package:areweeven/utils/extensions/go_router_context.dart';
import 'package:awe_api/awe_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_list_providers.g.dart';

class GroupListTexts {
  final String title;
  final String emptyDataPlaceholder;

  GroupListTexts({
    required this.title,
    required this.emptyDataPlaceholder,
  });
}

@riverpod
GroupListTexts groupListTexts(GroupListTextsRef ref) {
  final localizations = ref.watch(localizationProvider);
  return GroupListTexts(
    title: localizations.groupsTabTitle,
    emptyDataPlaceholder: localizations.emptyGroupListPlaceholder,
  );
}

@riverpod
class GroupListActions extends _$GroupListActions
    with ProviderRouterContextMixin {
  @override
  void build() {}

  Future<void> didTapAdd() async {
    final group = await const CreateGroupRoute().push(context);
    if (group == null) return;
    ref.read(groupListItemsProvider.notifier).addGroup(group);
  }

  Future<void> didTapRemoveGroup(Group group) async {
    try {
      await ref.read(aweApiClientProvider).deleteGroup(group.id);
      ref.read(groupListItemsProvider.notifier).removeGroup(group);
    } catch (e) {
      ref.read(globalErrorProvider.notifier).showError(e);
    }
  }

  void didTapGroup(Group group) {
    GroupDetailRoute(group.id).push(context);
  }
}

class GroupItem {
  Function() onDidTapRemove;
  Function() onPressed;
  int id;
  String title;
  String? stateIndicatingSubtitle;

  GroupItem({
    required this.onDidTapRemove,
    required this.onPressed,
    required this.id,
    required this.title,
    this.stateIndicatingSubtitle,
  });
}

@riverpod
class GroupListItems extends _$GroupListItems {
  @override
  Future<List<GroupItem>> build() {
    ref.watch(currentGroupProvider);
    return ref
        .watch(aweApiClientProvider)
        .getAllGroups()
        .then((groups) => groups.map(_makeItem).toList());
  }

  GroupItem _makeItem(Group group) => GroupItem(
        onDidTapRemove: () => ref.actions.didTapRemoveGroup(group),
        onPressed: () => ref.actions.didTapGroup(group),
        title: group.name,
        stateIndicatingSubtitle:
            group.isDefault ?? false ? ref.localizations.current : null,
        id: group.id,
      );

  void addGroup(Group group) {
    state = AsyncValue.data(
      [
        ...(state.value ?? []),
        _makeItem(group),
      ],
    );
  }

  void removeGroup(Group group) {
    final groups = (state?.value ?? []);
    groups.removeWhere((element) => element.id == group.id);
    state = AsyncValue.data(groups);
  }
}

extension _Actions<T> on AsyncNotifierProviderRef<T> {
  GroupListActions get actions => read(groupListActionsProvider.notifier);

  AppLocalizations get localizations => read(localizationProvider);
}
