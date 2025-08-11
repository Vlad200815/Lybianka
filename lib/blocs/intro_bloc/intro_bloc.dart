import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lybianka/repositories/intro/intro_repository_interface.dart';
import 'package:lybianka/repositories/intro/model/intro_model.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  final IntroRepositoryInterface introRepo;
  IntroBloc({required this.introRepo}) : super(IntroInitial()) {
    on<OnSaveIntroEvent>((event, emit) async {
      try {
        await introRepo.saveIntroInfo(event.introModel);
      } catch (e) {
        log(e.toString());
      }
    });

    on<OnGetIntroEvent>((event, emit) async {
      emit(IntroProgressState());
      try {
        final IntroModel introModel = await introRepo.getIntroInfo();
        emit(IntroSuccessState(introModel: introModel));
      } catch (e) {
        emit(IntroFailureState());
        log(e.toString());
      }
    });
  }
}
