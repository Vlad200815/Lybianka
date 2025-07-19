import 'model/model.dart';

abstract interface class CategoryRepositoryInterface {
  //Category
  Future<void> saveCategory(List<Category> category);
  Future<Category> getCategory();
  Future<void> removeCategory();
  //Current Money
  Future<void> saveMoney(double money);
  Future<double> getMoney();
}
