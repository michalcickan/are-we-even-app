import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_item_type.freezed.dart';

@freezed
class SettingItemType with _$SettingItemType {
  const factory SettingItemType.profile() = Profile;

  // const factory SettingItemType.darkMode(
  //   bool value,
  //   void Function(bool) onValueChanged,
  // ) = Appearance;
  const factory SettingItemType.appearance() = Appearance;

  const factory SettingItemType.updateProfileInfo() = UpdateProfileInfo;

  const factory SettingItemType.addAddress() = AddAddress;

  const factory SettingItemType.logout() = Logout;
}

class SettingListItem {
  final String title;
  final SettingItemType type;
  final Function() onPressed;

  SettingListItem(
    this.title,
    this.type,
    this.onPressed,
  );
}
