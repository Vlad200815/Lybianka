import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lybianka/repositories/aim_category/aim_category_repository_interface.dart';
import 'package:lybianka/repositories/aim_category/model/aim_category.dart';

part 'aim_category_event.dart';
part 'aim_category_state.dart';

class AimCategoryBloc extends Bloc<AimCategoryEvent, AimCategoryState> {
  final AimCategoryRepositoryInterface aimCategoryRepo;
  AimCategoryBloc({required this.aimCategoryRepo})
    : super(AimCategoryInitial()) {
    on<OnSaveAimCategoryEvent>((event, emit) async {
      try {
        await aimCategoryRepo.saveAimCategory(event.aimCategory);
      } catch (e) {
        log(e.toString());
      }
    });

    on<OnGetAimCategoryEvent>((event, emit) async {
      emit(AimCategoryProgressState());
      try {
        final AimCategoryModel aimCategory = await aimCategoryRepo
            .getAimCategory();
        emit(AimCategoryGetSuccessState(aimCategory: aimCategory));
      } catch (e) {
        emit(AimCategoryFailureState(errorMessage: e.toString()));
        log(e.toString());
      }
    });
  }
}
