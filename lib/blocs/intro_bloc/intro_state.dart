part of 'intro_bloc.dart';

sealed class IntroState extends Equatable {
  const IntroState();

  @override
  List<Object> get props => [];
}

final class IntroInitial extends IntroState {}

final class IntroProgressState extends IntroState {}

final class IntroFailureState extends IntroState {}

final class IntroSuccessState extends IntroState {
  const IntroSuccessState({required this.introModel});

  final IntroModel introModel;

  @override
  List<Object> get props => [introModel];
}
