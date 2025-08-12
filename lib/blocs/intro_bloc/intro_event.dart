part of 'intro_bloc.dart';

sealed class IntroEvent extends Equatable {
  const IntroEvent();

  @override
  List<Object> get props => [];
}

class OnGetNameEvent extends IntroEvent {}

class OnSaveIntroDataEvent extends IntroEvent {
  const OnSaveIntroDataEvent({required this.introModel});

  final IntroModel introModel;

  @override
  List<Object> get props => [introModel];
}

class OnIsSeenIntroEvent extends IntroEvent {}
