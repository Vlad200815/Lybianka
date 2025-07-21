import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'category_repository_export.dart';

class CategoryRepository implements CategoryRepositoryInterface {
  final SharedPreferences preferences;

  CategoryRepository({required this.preferences});

  static const _allMoney = "all_money";
  static const _allHistory = "all_history";

  // @override
  // Future<void> saveCategory(List<Category> category) async {
  //   try {
  //     List<String> jsonString = category
  //         .map((element) => jsonEncode(element.toJson()))
  //         .toList();
  //     await preferences.setStringList(_allHistory, jsonString);
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  @override
  Future<void> saveCategory(Category category) async {
    try {
      final String? jsonString = preferences.getString(_allHistory);
      List<Category> categoryList = [];

      if (jsonString != null) {
        final List<dynamic> decoded = jsonDecode(jsonString);
        categoryList = decoded
            .map((element) => Category.fromJson(element))
            .toList();
      }

      categoryList.add(category);

      final String updatedJson = jsonEncode(
        categoryList.map((element) => element.toJson()).toList(),
      );

      await preferences.setString(_allHistory, updatedJson);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<List<Category>> getCategory() async {
    try {
      String? jsonString = preferences.getString(_allHistory);
      if (jsonString == null) return [];

      final List<dynamic> decoded = jsonDecode(jsonString);

      return decoded.map((element) => Category.fromJson(element)).toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> removeCategory(String id) async {
    String? jsonString = preferences.getString(_allHistory);
    if (jsonString == null) return;

    final List<dynamic> decoded = jsonDecode(jsonString);
    List<Category> categoryList = decoded
        .map((element) => Category.fromJson(element))
        .toList();

    categoryList.removeWhere((category) => category.id == id);

    final String updatedJsonString = jsonEncode(
      categoryList.map((element) => element.toJson()).toList(),
    );

    await preferences.setString(_allHistory, updatedJsonString);
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
