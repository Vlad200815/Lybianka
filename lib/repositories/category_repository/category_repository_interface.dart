import 'model/model.dart';

abstract interface class CategoryRepositoryInterface {
  //Category
  Future<void> saveCategory(Category category);
  Future<List<Category>> getCategory();
  Future<void> removeCategory(String id);
  //Current Money
  Future<void> saveMoney();
  Future<double> getMoney();
  //graph
  Future<void> saveGraph(List<double> graph, String date);
  Future<List<double>> getGraph();
  // Future<void> clearGraph();
}
