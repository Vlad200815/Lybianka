import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lybianka/repositories/category_repository/category_repository_export.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({required this.categoryRepository}) : super(CategoryInitial()) {
    on<OnSaveCategoryEvent>((event, emit) async {
      emit(CategoryProgressState());
      try {
        await categoryRepository.saveCategory(
          Category(
            id: event.id,
            isProfit: event.isProfit,
            money: event.money,
            description: event.description,
            icon: event.icon,
            color: event.color,
            date: event.date,
          ),
        );
        emit(SaveCategorySuccessState());
      } catch (e) {
        emit(CategoryFailureState(errorMessage: e.toString()));
        log(e.toString());
      }
    });

    on<OnGetCategoryEvent>((event, emit) async {
      try {
        emit(CategoryProgressState());
        List<Category> categories = await categoryRepository.getCategory();
        emit(GetCategorySuccessState(categories: categories));
      } catch (e) {
        emit(CategoryFailureState(errorMessage: e.toString()));
        log(e.toString());
      }
    });

    on<OnRemoveCategoryEvent>((event, emit) async {
      emit(CategoryProgressState());
      try {
        await categoryRepository.removeCategory(event.id);
        emit(RemoveCategorySuccessState());
      } catch (e) {
        emit(CategoryFailureState(errorMessage: e.toString()));
        log(e.toString());
      }
    });
  }
}
