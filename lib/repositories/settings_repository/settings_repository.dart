import 'dart:convert';
import 'dart:developer';
import 'package:lybianka/repositories/settings_repository/model/profile_model.dart';
import 'package:lybianka/repositories/settings_repository/settings_repository_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository implements SettingsRepositoryInterface {
  final SharedPreferences prefs;

  SettingsRepository({required this.prefs});

  static const _profileStorage = "profile_storage";
  static const _isDarkTheme = "is_dark_theme";

  @override
  Future<void> saveProfile(ProfileModel profile) async {
    try {
      final String encoded = jsonEncode(profile.toJson());
      await prefs.setString(_profileStorage, encoded);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<ProfileModel> getProfile() async {
    try {
      String? jsonString = prefs.getString(_profileStorage);
      if (jsonString == null) {
        final defaultProfile = ProfileModel.initial();
        await saveProfile(defaultProfile);
        return defaultProfile;
      }
      Map<String, dynamic> json = jsonDecode(jsonString);
      return ProfileModel.fromJson(json);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  bool isDarkThemeSelected() {
    final selected = prefs.getBool(_isDarkTheme);
    return selected ?? false;
  }

  @override
  Future<void> setDarkThemeSelected(bool selected) async {
    await prefs.setBool(_isDarkTheme, selected);
  }
}
