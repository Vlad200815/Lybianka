part of 'aim_category_bloc.dart';

sealed class AimCategoryEvent extends Equatable {
  const AimCategoryEvent();

  @override
  List<Object> get props => [];
}

class OnGetAimCategoryEvent extends AimCategoryEvent {}

class OnSaveAimCategoryEvent extends AimCategoryEvent {
  const OnSaveAimCategoryEvent({required this.aimCategory});

  final AimCategoryModel aimCategory;

  @override
  List<Object> get props => [aimCategory];
}
