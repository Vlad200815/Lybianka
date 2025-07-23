part of 'category_bloc.dart';

@immutable
sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryProgressState extends CategoryState {}

final class GetCategorySuccessState extends CategoryState {
  final List<Category> categories;

  const GetCategorySuccessState({required this.categories});

  @override
  List<Object> get props => [categories];
}

final class CategoryFailureState extends CategoryState {
  final String errorMessage;

  const CategoryFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class RemoveCategorySuccessState extends CategoryState {}

final class SaveCategorySuccessState extends CategoryState {}
