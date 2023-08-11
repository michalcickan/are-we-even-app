import 'package:areweeven/extensions/go_router_context.dart';
import 'package:areweeven/global_providers/awe_api_client_provider.dart';
import 'package:areweeven/global_providers/current_user_provider.dart';
import 'package:areweeven/global_providers/global_error_provider.dart';
import 'package:areweeven/global_providers/localization_provider.dart';
import 'package:awe_api/awe_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_profile_providers.g.dart';

class UpdateProfileTexts {
  final String title;
  final String? description;
  final String bottomButtonTitle;
  final String? namePlaceholder;
  final String? middleNamePlaceholder;
  final String? surnamePlaceholder;

  UpdateProfileTexts({
    required this.title,
    this.description,
    required this.bottomButtonTitle,
    this.middleNamePlaceholder,
    this.namePlaceholder,
    this.surnamePlaceholder,
  });
}

@riverpod
UpdateProfileTexts updateProfileTexts(UpdateProfileTextsRef ref) {
  final localizations = ref.watch(localizationProvider);
  return UpdateProfileTexts(
      title: localizations.profileTitle,
      bottomButtonTitle: localizations.save,
      middleNamePlaceholder: localizations.middleNamePlaceholder,
      surnamePlaceholder: localizations.surnamePlaceholder,
      namePlaceholder: localizations.namePlaceholder);
}

@riverpod
class UpdateProfileActions extends _$UpdateProfileActions
    with ProviderRouterContextMixin {
  @override
  void build() {}

  Future<void> didTapBottomButton() async {
    try {
      final user = ref.read(updateProfileUserProvider)!;
      final newUser = await ref.read(aweApiClientProvider).updateUser(
        UpdateUserParameters(
          name: user.name,
          middleName: user.middleName,
          surname: user.surname,
        ),
      );
      ref.read(currentUserProvider.notifier).setUser(newUser);
    } catch (e) {
      ref.read(globalErrorProvider.notifier).showError(e);
    }
  }
}

@riverpod
class UpdateProfileUser extends _$UpdateProfileUser {
  @override
  User? build() {
    return ref.watch(currentUserProvider);
  }
}
