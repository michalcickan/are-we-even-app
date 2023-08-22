import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/utils/extensions/go_router_context.dart';
import 'package:areweeven/view_models/list_item_view_model.dart';
import 'package:awe_api/awe_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_invitation_list_providers.g.dart';

class GroupInvitationListTexts {
  final String title;
  final String emptyDataPlaceholder;

  GroupInvitationListTexts(
      {required this.title, required this.emptyDataPlaceholder});
}

@riverpod
GroupInvitationListTexts groupInvitationListTexts(
    GroupInvitationListTextsRef ref) {
  final localizations = ref.watch(localizationProvider);
  return GroupInvitationListTexts(
    title: localizations.groupInvitationsTitle,
    emptyDataPlaceholder: localizations.emptyInvitationListPlaceholder,
  );
}

@riverpod
class GroupInvitationListActions extends _$GroupInvitationListActions
    with ProviderRouterContextMixin {
  @override
  void build() {}

  void didTapInvitation(Invitation invitation) {
    return;
  }
}

@riverpod
FutureOr<List<ListItemViewModel<int>>> groupInvitationListItems(
    GroupInvitationListItemsRef ref) {
  return ref.watch(aweApiClientProvider).getAllInvitations().then(
        (invitations) => invitations
            .map(
              (e) => ListItemViewModel(
                e.id,
                title: e.group.name,
                onPressed: () => ref
                    .read(groupInvitationListActionsProvider.notifier)
                    .didTapInvitation(e),
              ),
            )
            .toList(),
      );
}
