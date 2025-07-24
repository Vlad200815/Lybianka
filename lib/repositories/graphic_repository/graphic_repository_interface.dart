import 'package:lybianka/repositories/graphic_repository/model/income_entry_model.dart';

abstract interface class GraphicRepositoryInterface {
  Future<void> saveIncomeEntry(IncomeEntry entry);
  Future<List<IncomeEntry>> getWeekIncome();
  // Future<double> isMore();
}
