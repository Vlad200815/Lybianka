import 'package:lybianka/repositories/aim_category/model/aim_category.dart';

abstract interface class AimCategoryRepositoryInterface {
  Future<void> saveAimCategory(AimCategoryModel aimCategory);
  Future<AimCategoryModel> getAimCategory();
}
