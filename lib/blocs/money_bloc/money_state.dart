part of 'money_bloc.dart';

sealed class MoneyState extends Equatable {
  const MoneyState();

  @override
  List<Object> get props => [];
}

final class MoneyInitial extends MoneyState {}

final class MoneyGetSuccessState extends MoneyState {
  const MoneyGetSuccessState({required this.money});

  final double money;

  @override
  List<Object> get props => [money];
}

final class MoneyProgressState extends MoneyState {}

final class MoneyFailureState extends MoneyState {
  const MoneyFailureState({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
