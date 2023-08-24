import 'package:areweeven/gen/app_localizations.dart';
import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:areweeven/global_providers/current_group_provider.dart';
import 'package:areweeven/global_providers/dialog_provider.dart';
import 'package:areweeven/global_providers/global_error_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/routes/groups_routes.dart';
import 'package:areweeven/routes/routes.dart';
import 'package:areweeven/utils/extensions/go_router_context.dart';
import 'package:areweeven/utils/list_section.dart';
import 'package:areweeven/utils/logger.dart';
import 'package:areweeven/view_models/list_item_view_model.dart';
import 'package:areweeven/view_models/removable_list_item_view_model.dart';
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
    ref.read(groupListSectionsProvider.notifier).addGroup(group);
  }

  void didTapRemoveGroup(Group group) async {
    try {
      await ref.read(aweApiClientProvider).deleteGroup(group.id);
      ref.read(groupListSectionsProvider.notifier).removeGroup(group);
    } catch (e) {
      ref.read(globalErrorProvider.notifier).showError(e);
    }
  }

  void didTapGroup(Group group) {
    GroupDetailRoute(group.id).push(context);
  }

  void didTapGroupInvitation(Invitation invitation) {
    final localizations = ref.read(localizationProvider);
    ref.read(dialogProvider.notifier).showDialog(
          DialogInfo(
            "",
            text: localizations.invitationAcceptInfoText,
            actionItems: [
              DialogActionItem(
                localizations.yes,
                () => _resolveInvitation(
                  InvitationResolution.accept,
                  invitation,
                ),
              ),
              DialogActionItem(
                localizations.decline,
                () => _resolveInvitation(
                  InvitationResolution.decline,
                  invitation,
                ),
              ),
            ],
            dismissDialogButtonType: null,
          ),
        );
  }

  Future<void> _resolveInvitation(
      InvitationResolution resolution, Invitation invitation) async {
    try {
      await ref.read(aweApiClientProvider).resolveInvitation(
            invitation.id,
            resolution,
          );
      if (resolution == InvitationResolution.accept) {
        ref.refresh(groupListSectionsProvider);
      }
    } catch (e) {
      ref.read(globalErrorProvider.notifier).showError(e);
    }
  }
}

typedef GroupListSection = ListSection<String>;

@riverpod
class GroupListSections extends _$GroupListSections {
  @override
  Future<List<GroupListSection>> build() async {
    ref.watch(currentGroupProvider);
    final client = ref.watch(aweApiClientProvider);
    final sections = [
      _makeMainSection(
        (await client.getAllGroups()).map(_makeItem).toList(),
      ),
    ];
    try {
      final invitationsSection =
          _makeInvitationsSection(await client.getAllInvitations());
      if (invitationsSection != null) {
        sections.add(invitationsSection);
      }
    } catch (e) {
      logger.e(e);
    }
    return sections;
  }

  RemovableListItemViewModel _makeItem(Group group) =>
      RemovableListItemViewModel.fromGroup(
        group,
        localizations: ref.localizations,
        onDidTapRemove: ref.actions.didTapRemoveGroup,
        onPressed: ref.actions.didTapGroup,
      );

  void addGroup(Group group) {
    final mainSection = _mainSection;
    mainSection.viewModels.add(_makeItem(group));
    _setNewMainSection(mainSection);
  }

  void removeGroup(Group group) {
    final mainSection = _mainSection;
    if (mainSection.viewModels.isEmpty) return;
    mainSection.viewModels.removeWhere((element) => element.id == group.id);
    _setNewMainSection(mainSection);
  }

  GroupListSection get _mainSection =>
      state.value?.first ?? _makeMainSection([]);

  GroupListSection? _makeInvitationsSection(List<Invitation> invitations) {
    if (invitations.isEmpty) return null;
    return ListSection(
      ref.read(localizationProvider).groupInvitationsTitle,
      invitations
          .map(
            (invitation) => ListItemViewModel(
              invitation.id,
              title: invitation.group.name,
              onPressed: () => ref
                  .read(groupListActionsProvider.notifier)
                  .didTapGroupInvitation(
                    invitation,
                  ),
            ),
          )
          .toList(),
    );
  }

  GroupListSection _makeMainSection(
          List<RemovableListItemViewModel> viewModels) =>
      GroupListSection(
        ref.read(localizationProvider).yourGroupsSectionTitle,
        viewModels,
      );

  void _setNewMainSection(GroupListSection mainSection) {
    final newState = state.value ?? [];
    newState[0] = mainSection;
    state = AsyncValue.data(state.value ?? [mainSection]);
  }
}

extension _Actions<T> on AsyncNotifierProviderRef<T> {
  GroupListActions get actions => read(groupListActionsProvider.notifier);

  AppLocalizations get localizations => read(localizationProvider);
}
