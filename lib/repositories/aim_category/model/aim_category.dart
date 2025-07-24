import 'package:equatable/equatable.dart';

class AimCategoryModel extends Equatable {
  final String name;
  final num price;

  const AimCategoryModel({required this.name, required this.price});

  Map<String, dynamic> toJson() {
    return {"name": name, "price": price};
  }

  factory AimCategoryModel.fromJson(Map<String, dynamic> json) {
    return AimCategoryModel(name: json["name"], price: json["price"]);
  }

  factory AimCategoryModel.initial() {
    return AimCategoryModel(name: "Постав ціль", price: 0);
  }

  @override
  List<Object?> get props => [name, price];
}
