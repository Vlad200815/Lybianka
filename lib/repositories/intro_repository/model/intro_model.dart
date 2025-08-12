import 'package:equatable/equatable.dart';

class IntroModel extends Equatable {
  const IntroModel({required this.name, required this.startingMoney});

  final String name;
  final double startingMoney;

  // Map<String, dynamic> toJson() {
  //   return {"name": name, "startingMoney": startingMoney};
  // }

  // factory IntroModel.formJson(Map<String, dynamic> json) {
  //   return IntroModel(name: json["name"], startingMoney: json["startingMoney"]);
  // }

  @override
  List<Object?> get props => [name, startingMoney];
}
