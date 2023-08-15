import 'package:areweeven/extensions/go_router_context.dart';
import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:areweeven/global_providers/global_error_provider.dart';
import 'package:areweeven/global_providers/go_router_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:areweeven/utils/update_value_mixin.dart';
import 'package:awe_api/awe_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_group_providers.g.dart';

class CreateGroupTexts {
  final String title;
  final String bottomButtonTitle;
  final String? groupNamePlaceholder;

  CreateGroupTexts({
    required this.title,
    required this.bottomButtonTitle,
    this.groupNamePlaceholder,
  });
}

@riverpod
CreateGroupTexts createGroupTexts(CreateGroupTextsRef ref) {
  final localizations = ref.watch(localizationProvider);
  return CreateGroupTexts(
    title: localizations.createGroupTitle,
    bottomButtonTitle: localizations.save,
    groupNamePlaceholder: localizations.groupNamePlaceholder,
  );
}

@riverpod
class CreateGroupActions extends _$CreateGroupActions
    with ProviderRouterContextMixin {
  @override
  void build() {}

  Future<void> didTapBottomButton() async {
    try {
      final group = await ref.read(aweApiClientProvider).createGroup(
            CreateGroupParameters(
              name: ref.read(createGroupNameProvider),
            ),
          );
      ref.read(goRouterProvider).pop(group);
    } catch (e) {
      ref.read(globalErrorProvider.notifier).showError(e);
    }
  }
}

@riverpod
class CreateGroupName extends _$CreateGroupName with UpdateValue {
  @override
  String build() {
    return "";
  }
}

@riverpod
bool createGroupBottomButtonEnabled(CreateGroupBottomButtonEnabledRef ref) {
  return ref.watch(createGroupNameProvider).isNotEmpty;
}
