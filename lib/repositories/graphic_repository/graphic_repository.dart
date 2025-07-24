import 'dart:convert';
import 'dart:developer';

import 'package:lybianka/repositories/graphic_repository/graphic_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/income_entry_model.dart';

class GraphicRepository implements GraphicRepositoryInterface {
  final SharedPreferences preferences;

  const GraphicRepository({required this.preferences});

  static const _incomesKey = "incomes";

  @override
  Future<void> saveIncomeEntry(IncomeEntry entry) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final list = prefs.getStringList(_incomesKey) ?? [];

      list.add(jsonEncode(entry.toJson()));
      await prefs.setStringList('incomes', list);
    } catch (e) {
      log(e.toString());
    }
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Future<List<IncomeEntry>> getWeekIncome() async {
    try {
      final list = preferences.getStringList(_incomesKey) ?? [];

      final all = list.map((e) => IncomeEntry.fromJson(jsonDecode(e))).toList();

      final now = DateTime.now();
      final sevenDayAgo = now.subtract(Duration(days: 6));

      return all.where((e) {
        return e.date.isAfter(sevenDayAgo) || _isSameDay(e.date, sevenDayAgo);
      }).toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  // @override
  // Future<double> isMore() async {
  //   try {
  //     DateTime now = DateTime.now();

  //     final List<IncomeEntry> entryList = await getWeekIncome();

  //     double maxAmount = 0;

  //     for (var i = 0; i < entryList.length; i++) {
  //       if (_isSameDay(entryList[i].date, now)) {
  //         maxAmount = maxAmount + entryList[i].amount;
  //       }
  //     }

  //     if (maxAmount > 3000) {
  //       return maxAmount;
  //     } else {
  //       return 3000;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     rethrow;
  //   }
  // }
}
