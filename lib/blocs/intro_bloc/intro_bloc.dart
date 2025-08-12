import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../repositories/intro_repository/intro_expo.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  final IntroInterfaceRepository introRepo;

  IntroBloc({required this.introRepo}) : super(IntroInitial()) {
    on<OnSaveIntroDataEvent>((event, emit) async {
      try {
        await introRepo.setIntroSeen(
          IntroModel(name: event.name, startingMoney: event.startingMoney),
        );
      } catch (e) {
        log(e.toString());
      }
    });

    on<OnGetNameEvent>((event, emit) async {
      emit(IntroProgressState());
      try {
        String name = await introRepo.getName();
        emit(IntroGetNameSuccessState(name: name));
      } catch (e) {
        emit(IntroFailureState());
        log(e.toString());
      }
    });

    on<OnIsSeenIntroEvent>((event, emit) async {
      try {
        bool isSeen = await introRepo.hasIntroSeen();
        emit(IntroIsSeenSuccessState(isSeen: isSeen));
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
