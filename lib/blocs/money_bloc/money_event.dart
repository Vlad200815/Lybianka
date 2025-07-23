part of 'money_bloc.dart';

sealed class MoneyEvent extends Equatable {
  const MoneyEvent();

  @override
  List<Object> get props => [];
}

class OnGetMoneyEvent extends MoneyEvent {}

class OnSaveMoneyEvent extends MoneyEvent {}
