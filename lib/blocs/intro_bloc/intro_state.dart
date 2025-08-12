part of 'intro_bloc.dart';

sealed class IntroState extends Equatable {
  const IntroState();

  @override
  List<Object> get props => [];
}

final class IntroInitial extends IntroState {}

final class IntroGetNameSuccessState extends IntroState {
  const IntroGetNameSuccessState({required this.name});

  final String name;
}

final class IntroIsSeenSuccessState extends IntroState {
  const IntroIsSeenSuccessState({required this.isSeen});

  final bool isSeen;
}

final class IntroFailureState extends IntroState {}

final class IntroProgressState extends IntroState {}
