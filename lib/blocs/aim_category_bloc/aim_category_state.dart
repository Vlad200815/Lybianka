part of 'aim_category_bloc.dart';

sealed class AimCategoryState extends Equatable {
  const AimCategoryState();

  @override
  List<Object> get props => [];
}

final class AimCategoryInitial extends AimCategoryState {}

final class AimCategoryProgressState extends AimCategoryState {}

final class AimCategoryFailureState extends AimCategoryState {
  const AimCategoryFailureState({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

final class AimCategoryGetSuccessState extends AimCategoryState {
  const AimCategoryGetSuccessState({required this.aimCategory});

  final AimCategoryModel aimCategory;

  @override
  List<Object> get props => [aimCategory];
}
