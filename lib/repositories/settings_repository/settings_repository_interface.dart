import 'package:lybianka/repositories/settings_repository/model/profile_model.dart';

abstract interface class SettingsRepositoryInterface {
  Future<void> saveProfile(ProfileModel profile);
  Future<ProfileModel> getProfile();
}
