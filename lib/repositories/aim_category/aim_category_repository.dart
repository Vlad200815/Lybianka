import 'dart:convert';
import 'dart:developer';

import 'package:lybianka/repositories/aim_category/aim_category_repository_interface.dart';
import 'package:lybianka/repositories/aim_category/model/aim_category.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AimCategoryRepository implements AimCategoryRepositoryInterface {
  final SharedPreferences preferences;

  static const _aimCategoryKey = "aim_category_key";

  AimCategoryRepository({required this.preferences});
  @override
  Future<void> saveAimCategory(AimCategoryModel aimCategory) async {
    try {
      final String encoded = jsonEncode(aimCategory.toJson());
      await preferences.setString(_aimCategoryKey, encoded);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<AimCategoryModel> getAimCategory() async {
    try {
      String? jsonStirng = preferences.getString(_aimCategoryKey);
      if (jsonStirng == null) {
        final defaultAimCategory = AimCategoryModel.initial();
        await saveAimCategory(defaultAimCategory);
        return defaultAimCategory;
      }
      Map<String, dynamic> json = jsonDecode(jsonStirng);
      return AimCategoryModel.fromJson(json);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
