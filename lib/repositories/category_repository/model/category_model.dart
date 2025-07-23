import 'package:equatable/equatable.dart';

class Category extends Equatable {
  Category({
    required this.id,
    required this.isProfit,
    required this.money,
    required this.description,
    required this.icon,
    required this.color,
    required this.date,
  });

  String id;
  bool isProfit;
  double money;
  String description;
  String icon;
  int color;
  String date;

  Map<String, dynamic> toJson() => {
    "id": id,
    "isProfit": isProfit,
    "money": money,
    "description": description,
    "icon": icon,
    "color": color,
    "date": date,
  };

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    isProfit: json["isProfit"],
    money: json["money"],
    description: json["description"],
    icon: json["icon"],
    color: json["color"],
    date: json["date"],
  );

  @override
  List<Object?> get props => [
    id,
    isProfit,
    money,
    description,
    icon,
    color,
    date,
  ];
}
