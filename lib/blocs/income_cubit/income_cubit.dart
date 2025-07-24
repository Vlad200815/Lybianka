import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lybianka/repositories/graphic_repository/graphic_repository_interface.dart';
import 'package:lybianka/repositories/graphic_repository/model/income_entry_model.dart';

part 'income_state.dart';

class IncomeCubit extends Cubit<IncomeCubitState> {
  final GraphicRepositoryInterface graphicRepo;
  IncomeCubit({required this.graphicRepo})
    : super(IncomeCubitState(weekData: List.filled(7, 0))) {
    loadWeekData();
  }

  Future<void> saveIncomeEntry(IncomeEntry entry) async {
    await graphicRepo.saveIncomeEntry(entry);
    await loadWeekData();
  }

  Future<void> loadWeekData() async {
    final incomes = await graphicRepo.getWeekIncome();
    final List<double> data = List.filled(7, 0);

    for (final income in incomes) {
      final weekIndex = income.date.weekday - 1;
      data[weekIndex] += income.amount;
    }

    log("weekData emitted");
    emit(IncomeCubitState(weekData: data));
  }

  // Future<double> isMore() async {
  //   return await graphicRepo.isMore();
  // }
}
