part of 'income_cubit.dart';

class IncomeCubitState extends Equatable {
  final List<double> weekData;

  const IncomeCubitState({required this.weekData});

  @override
  List<Object> get props => [weekData];
}
