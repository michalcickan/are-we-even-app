import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:areweeven/global_providers/current_group_provider.dart';
import 'package:areweeven/global_providers/global_error_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/routes/groups_routes.dart';
import 'package:areweeven/routes/routes.dart';
import 'package:areweeven/utils/extensions/go_router_context.dart';
import 'package:areweeven/utils/list_section.dart';
import 'package:areweeven/view_models/list_item_view_models.dart';
import 'package:awe_api/awe_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_detail_providers.g.dart';

class GroupDetailTexts {
  final String title;
  final String bottomButtonTitle;

  GroupDetailTexts({
    required this.title,
    required this.bottomButtonTitle,
  });
}

@riverpod
GroupDetailTexts groupDetailTexts(GroupDetailTextsRef ref, int groupId) {
  final localizations = ref.watch(localizationProvider);
  return GroupDetailTexts(
    title: ref.watch(_groupDetailProvider(groupId)).value?.name ?? "",
    bottomButtonTitle: localizations.switchToButtonTitle,
  );
}

@riverpod
class GroupDetailActions extends _$GroupDetailActions
    with ProviderRouterContextMixin {
  @override
  void build() {}

  void didTapAddUser(int groupId) {
    AddGroupMemberRoute(groupId).push(context);
  }

  Future<void> didTapSetDefault(int groupId) async {
    try {
      await ref.read(currentGroupProvider.notifier).setDefaultGroup(groupId);
    } catch (e) {
      ref.read(globalErrorProvider.notifier).showError(e);
    }
  }
}

@riverpod
FutureOr<Group> _groupDetail(_GroupDetailRef ref, int groupId) {
  return ref.watch(aweApiClientProvider).getGroup(groupId);
}

@riverpod
FutureOr<ListSection<String>> groupDetailMembers(
  GroupDetailMembersRef ref,
  int groupId,
) {
  return ref.watch(_groupDetailProvider(groupId).future).then(
        (groupDetail) => ListSection(
          "Members",
          groupDetail.members!
              .map(
                (e) => ListItemViewModel.fromUser(
                  e,
                  localizations: ref.watch(localizationProvider),
                  onPressed: (_) {},
                ),
              )
              .toList(),
        ),
      );
}

@riverpod
bool groupDetailShowSwitchTo(GroupDetailShowSwitchToRef ref, int groupId) {
  final currentGroup = ref.watch(currentGroupProvider);
  return ref.watch(_groupDetailProvider(groupId)).maybeWhen(
        data: (detail) => detail.id != currentGroup.value?.id,
        orElse: () => false,
      );
}
