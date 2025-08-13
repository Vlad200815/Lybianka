import 'dart:developer';

import 'package:lybianka/repositories/intro_repository/intro_expo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroRepository implements IntroInterfaceRepository {
  const IntroRepository({required this.prefs});

  final SharedPreferences prefs;

  static const _hasIntroSeenKey = "has_intro_seen";
  static const _nameKey = "name";
  static const _strtingMoney = "starting_money";

  @override
  Future<void> setIntroSeen(IntroModel introModel) async {
    try {
      await prefs.setString(_nameKey, introModel.name);
      await prefs.setDouble(_strtingMoney, introModel.startingMoney);
      await prefs.setBool(_hasIntroSeenKey, true);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  bool hasIntroSeen() {
    return prefs.getBool(_hasIntroSeenKey) ?? false;
  }

  @override
  Future<String> getName() async {
    try {
      String? name = prefs.getString(_nameKey);
      if (name == null) {
        return "User";
      }
      return name;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
