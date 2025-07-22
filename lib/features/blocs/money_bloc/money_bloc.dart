import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lybianka/repositories/category_repository/category_repository_export.dart';

part 'money_event.dart';
part 'money_state.dart';

class MoneyBloc extends Bloc<MoneyEvent, MoneyState> {
  final CategoryRepository categoryRepo;

  MoneyBloc({required this.categoryRepo}) : super(MoneyInitial()) {
    on<OnSaveMoneyEvent>((event, emit) async {
      emit(MoneyProgressState());
      try {
        await categoryRepo.saveMoney();
        // emit(MoneySaveSuccessState());
      } catch (e) {
        emit(MoneyFailureState(errorMessage: e.toString()));
        log(e.toString());
      }
    });

    on<OnGetMoneyEvent>((event, emit) async {
      emit(MoneyProgressState());
      try {
        double money = await categoryRepo.getMoney();
        emit(MoneyGetSuccessState(money: money));
      } catch (e) {
        emit(MoneyFailureState(errorMessage: e.toString()));
        log(e.toString());
      }
    });
  }
}
