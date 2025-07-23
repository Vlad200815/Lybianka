import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProfileModel extends Equatable {
  ProfileModel({
    required this.avatar,
    required this.background,
    required this.border,
  });

  String avatar;
  int background;
  int border;

  Map<String, dynamic> toJson() {
    return {"avatar": avatar, "background": background, "border": border};
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      avatar: json["avatar"],
      background: json["background"],
      border: json["border"],
    );
  }

  factory ProfileModel.initial() {
    return ProfileModel(
      avatar: "assets/appearences/person.png",
      background: Colors.redAccent.value,
      border: Colors.redAccent.value,
    );
  }

  @override
  List<Object?> get props => [avatar, background, border];
}
