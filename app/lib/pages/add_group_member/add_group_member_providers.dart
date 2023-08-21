import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/utils/extensions/go_router_context.dart';
import 'package:areweeven/utils/extensions/riverpod_ref_helpers.dart';
import 'package:areweeven/utils/update_value_mixin.dart';
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

  void didTapBottomButton() {
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

class AddUserMemberResultItem {
  final Function(void) onPressed;
  final String title;
  final String? subtitle;

  AddUserMemberResultItem({
    required this.onPressed,
    required this.title,
    this.subtitle,
  });
}

@riverpod
Future<List<User>> addGroupSearchResults(AddGroupSearchResultsRef ref) async {
  final query = ref.watch(addGroupMemberSearchQueryProvider);
  await ref.debounce(const Duration(milliseconds: 500));

  return query.length > 2
      ? []
      : await ref.watch(aweApiClientProvider).searchUsers(
            UserSearchParameters(query: query),
          );
}
