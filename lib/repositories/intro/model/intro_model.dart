import 'package:equatable/equatable.dart';

class IntroModel extends Equatable {
  final String name;
  final double money;

  const IntroModel({required this.name, required this.money});

  Map<String, dynamic> toJson() {
    return {"name": name, "money": money};
  }

  factory IntroModel.fromJson(Map<String, dynamic> json) {
    return IntroModel(name: json["name"], money: json["money"]);
  }

  @override
  List<Object?> get props => [name, money];
}
