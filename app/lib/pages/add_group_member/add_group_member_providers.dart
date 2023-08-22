import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/utils/extensions/go_router_context.dart';
import 'package:areweeven/utils/extensions/riverpod_ref_helpers.dart';
import 'package:areweeven/utils/update_value_mixin.dart';
import 'package:areweeven/view_models/list_item_view_models.dart';
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

  void didSelectUser(User user) {
    return;
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
    AddGroupSearchResultsRef ref) async {
  final query = ref.watch(addGroupMemberSearchQueryProvider);
  await ref.debounce(const Duration(milliseconds: 500));

  return query.length < 3
      ? []
      : (await ref.watch(aweApiClientProvider).searchUsers(
                UserSearchParameters(
                  query: query,
                  offset: 0,
                  limit: 10,
                ),
              ))
          .map(
            (user) => ListItemViewModel.fromUser(
              user,
              localizations: ref.watch(localizationProvider),
              onPressed: ref
                  .read(addGroupMemberActionsProvider.notifier)
                  .didSelectUser,
            ),
          )
          .toList();
}
