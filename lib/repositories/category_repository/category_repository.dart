import 'dart:convert';
import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'category_repository_export.dart';

class CategoryRepository implements CategoryRepositoryInterface {
  final SharedPreferences preferences;

  CategoryRepository({required this.preferences});

  static const _allMoney = "all_money";
  static const _allHistory = "all_history";
  static const _graphHistory = "graphHistory";
  List<double> graphList = [0, 0, 0, 0, 0, 0, 0];

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
      if (money != null) {
        log("Your money is $money");
        return money;
      } else {
        return 0;
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  //TODO: create a function which will check if it is a new week has just started and claer it all

  @override
  Future<void> saveGraph(List<double> graph, String date) async {
    try {
      final parseDate = DateFormat("dd/MM/yyyy").parse(date);
      final weekdayName = DateFormat.EEEE().format(parseDate);

      int indexDay = 0;

      switch (weekdayName) {
        case "Monday":
          indexDay = 0;
        case "Tuesday":
          indexDay = 1;
        case "Wednesday":
          indexDay = 2;
        case "Thursday":
          indexDay = 3;
        case "Friday":
          indexDay = 4;
        case "Saturday":
          indexDay = 5;
        case "Sunday":
          indexDay = 6;
        default:
          indexDay = 0;
      }

      log("Index Day --->>> $indexDay");

      String? jsonString = preferences.getString(_allHistory);
      if (jsonString == null) return;
      final List<dynamic> decoded = jsonDecode(jsonString);
      List<Category> categoryList = decoded
          .map((element) => Category.fromJson(element))
          .toList();

      double dayPerformance = 0;

      for (var i = 0; i < categoryList.length; i++) {
        if (categoryList[i].date == date) {
          if (categoryList[i].isProfit) {
            dayPerformance = dayPerformance + categoryList[i].money;
          }
        }
      }

      log("Day performance -->> $dayPerformance");
      //TODO: continue work on this function
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<List<double>> getGraph() async {
    try {
      //TODO
      return [0, 0];
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
