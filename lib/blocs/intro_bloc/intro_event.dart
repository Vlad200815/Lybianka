part of 'intro_bloc.dart';

sealed class IntroEvent extends Equatable {
  const IntroEvent();

  @override
  List<Object> get props => [];
}

class OnGetNameEvent extends IntroEvent {}

class OnSaveIntroDataEvent extends IntroEvent {
  const OnSaveIntroDataEvent({required this.name, required this.startingMoney});

  final String name;
  final double startingMoney;

  @override
  List<Object> get props => [name, startingMoney];
}

class OnIsSeenIntroEvent extends IntroEvent {}
