import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import 'category_repository_export.dart';

class CategoryRepository implements CategoryRepositoryInterface {
  final SharedPreferences preferences;

  CategoryRepository({required this.preferences});

  static const _allMoney = "all_money";
  static const _allHistory = "all_history";

  @override
  Future<void> saveCategory(List<Category> category) async {
    try {
      List<String> jsonString = category
          .map((element) => jsonEncode(element.toJson()))
          .toList();
      await preferences.setStringList(_allHistory, jsonString);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<List<Category>> getCategory() async {
    try {
      List<String>? jsonList = preferences.getStringList(_allHistory);
      if (jsonList == null) return [];
      return jsonList
          .map((jsonStr) => Category.fromJson(jsonDecode(jsonStr)))
          .toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> removeCategory(String id) async {
    List<String>? jsonString = preferences.getStringList(_allHistory);
    if (jsonString == null) return;
    List<Category> categoryList = jsonString
        .map((jsonStr) => Category.fromJson(jsonDecode(jsonStr)))
        .toList();
    for (var i = 0; i < categoryList.length; i++) {
      if (id == categoryList[i].id) {
        categoryList.removeAt(i);
      }
    }
    List<String> updatedJsonList = categoryList
        .map((element) => jsonEncode(element.toJson()))
        .toList();
    await preferences.setStringList(_allHistory, updatedJsonList);
  }

  @override
  Future<void> saveMoney(double money) async {
    try {
      await preferences.setDouble(_allMoney, money);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<double> getMoney() async {
    try {
      double? money = preferences.getDouble(_allMoney);
      if (money != null) {
        return money;
      } else {
        return 0;
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
