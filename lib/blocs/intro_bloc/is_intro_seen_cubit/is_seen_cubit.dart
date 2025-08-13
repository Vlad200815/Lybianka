import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lybianka/repositories/intro_repository/intro_expo.dart';

part 'is_seen_state.dart';

class IsSeenCubit extends Cubit<IsSeenState> {
  IsSeenCubit({required this.introRepo}) : super(IsSeenState(route: "/")) {
    _heckIsIntroSeen();
  }

  final IntroInterfaceRepository introRepo;

  void _heckIsIntroSeen() {
    try {
      bool isSeen = introRepo.hasIntroSeen();
      if (isSeen) {
        emit(IsSeenState(route: "/home"));
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
