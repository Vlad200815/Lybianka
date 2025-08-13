import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'category_repository_export.dart';

class CategoryRepository implements CategoryRepositoryInterface {
  final SharedPreferences preferences;

  CategoryRepository({required this.preferences});

  static const _allMoney = "all_money";
  static const _allHistory = "all_history";

  bool isTakkenStartingMoney = false;

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
  Future<void> saveMoney() async {
    try {
      double money = 0;

      double startingMoney = preferences.getDouble("starting_money") ?? 0;
      money = money + startingMoney;

      final String? jsonString = preferences.getString(_allHistory);
      List<Category> categoryList = [];

      if (jsonString != null) {
        final List<dynamic> decoded = jsonDecode(jsonString);
        categoryList = decoded
            .map((element) => Category.fromJson(element))
            .toList();
      }

      for (var i = 0; i < categoryList.length; i++) {
        if (categoryList[i].isProfit == true) {
          money = money + categoryList[i].money;
        } else if (categoryList[i].isProfit == false) {
          money = money - categoryList[i].money;
        }
      }

      log(money.toString());

      await preferences.setDouble(_allMoney, money);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<double> getMoney() async {
    try {
      double? money = preferences.getDouble(_allMoney);
      double? startingMoney = preferences.getDouble("starting_money") ?? 0;
      log("startring money === $startingMoney and money === $money");

      if (money != null) {
        // if (isTakkenStartingMoney == false) {
        //   money = money + startingMoney;
        //   isTakkenStartingMoney = true;
        //   log("Starting Money was added");
        // }

        // money = money + startingMoney;
        log("Your money is $money");
        return money;
      } else {
        return startingMoney;
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
