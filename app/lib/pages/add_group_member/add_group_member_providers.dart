import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:areweeven/global_providers/dialog_provider.dart';
import 'package:areweeven/global_providers/global_error_provider.dart';
import 'package:areweeven/global_providers/go_router_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/utils/extensions/go_router_context.dart';
import 'package:areweeven/utils/extensions/riverpod_ref_helpers.dart';
import 'package:areweeven/utils/update_value_mixin.dart';
import 'package:areweeven/view_models/list_item_view_model.dart';
import 'package:awe_api/awe_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_group_member_providers.g.dart';

class AddGroupMemberTexts {
  final String title;
  final String? searchHint;

  AddGroupMemberTexts({
    required this.title,
    this.searchHint,
  });
}

@riverpod
AddGroupMemberTexts addGroupMemberTexts(AddGroupMemberTextsRef ref) {
  final localizations = ref.watch(localizationProvider);
  return AddGroupMemberTexts(
    title: localizations.addGroupMember,
    searchHint: localizations.searchUserHint,
  );
}

@riverpod
class AddGroupMemberActions extends _$AddGroupMemberActions
    with ProviderRouterContextMixin {
  @override
  void build() {}

  Future<void> didSelectUser(
    User user,
    int groupId,
  ) async {
    try {
      await ref.read(aweApiClientProvider).inviteUserToGroup(
            user.id,
            groupId,
          );
      final localizations = ref.read(localizationProvider);
      ref.read(dialogProvider.notifier).showDialog(
            DialogInfo(
              localizations.info,
              text: localizations.invitationSentText(user.name ?? user.email),
              dismissDialogButtonType: DismissDialogButtonType.ok,
              onDismiss: () => ref.read(goRouterProvider).pop(),
            ),
          );
    } catch (e) {
      ref.read(globalErrorProvider.notifier).showError(e);
    }
  }
}

@riverpod
class AddGroupMemberSearchQuery extends _$AddGroupMemberSearchQuery
    with UpdateValue {
  @override
  String build() {
    return "";
  }
}

@riverpod
Future<List<ListItemViewModel>> addGroupSearchResults(
    AddGroupSearchResultsRef ref, int groupId) async {
  final query = ref.watch(addGroupMemberSearchQueryProvider);
  await ref.debounce(const Duration(milliseconds: 500));
  if (query.length < 3) {
    return [];
  }

  final pageResult = await ref.watch(aweApiClientProvider).searchUsers(
        UserSearchParameters(
          query: query,
          offset: 0,
          limit: 10,
        ),
      );
  return pageResult.data
          ?.map(
            (user) => ListItemViewModel.fromUser(
              user,
              localizations: ref.watch(localizationProvider),
              onPressed: (user) => ref
                  .read(addGroupMemberActionsProvider.notifier)
                  .didSelectUser(
                    user,
                    groupId,
                  ),
            ),
          )
          .toList() ??
      [];
}

@riverpod
String emptyListText(EmptyListTextRef ref) {
  final localizations = ref.watch(localizationProvider);
  return ref.watch(addGroupMemberSearchQueryProvider).length < 2
      ? localizations.searchMinimumHint
      : localizations.noResultsFoundText;
}
