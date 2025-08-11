part of 'intro_bloc.dart';

sealed class IntroEvent extends Equatable {
  const IntroEvent();

  @override
  List<Object> get props => [];
}

class OnSaveIntroEvent extends IntroEvent {
  const OnSaveIntroEvent({required this.introModel});

  final IntroModel introModel;

  @override
  List<Object> get props => [introModel];
}

class OnGetIntroEvent extends IntroEvent {}
