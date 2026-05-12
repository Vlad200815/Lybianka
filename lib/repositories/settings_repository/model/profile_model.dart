import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProfileModel extends Equatable {
  const ProfileModel({
    required this.avatar,
    required this.background,
    required this.border,
  });

  final String avatar;
  final int background;
  final int border;

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
      background: Colors.redAccent.toARGB32(),
      border: Colors.redAccent.toARGB32(),
    );
  }

  @override
  List<Object?> get props => [avatar, background, border];
}
