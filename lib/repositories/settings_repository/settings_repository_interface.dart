import 'package:lybianka/repositories/settings_repository/model/profile_model.dart';

abstract interface class SettingsRepositoryInterface {
  //Profile picture
  Future<void> saveProfile(ProfileModel profile);
  Future<ProfileModel> getProfile();
  //Dark Theme
  bool isDarkThemeSelected();
  Future<void> setDarkThemeSelected(bool selected);
}
