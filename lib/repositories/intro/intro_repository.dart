import 'dart:convert';
import 'dart:developer';

import 'package:lybianka/repositories/intro/intro_repository_interface.dart';
import 'package:lybianka/repositories/intro/model/intro_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroRepository implements IntroRepositoryInterface {
  final SharedPreferences prefs;

  const IntroRepository({required this.prefs});

  static const _introInfoKey = "intro_info";

  @override
  Future<void> saveIntroInfo(IntroModel introModel) async {
    try {
      final String jsonString = jsonEncode(introModel.toJson());
      await prefs.setString(_introInfoKey, jsonString);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<IntroModel> getIntroInfo() async {
    try {
      String? jsonString = prefs.getString(_introInfoKey);
      Map<String, dynamic> json = jsonDecode(jsonString!);
      return IntroModel.fromJson(json);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
