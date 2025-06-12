import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hint,
    required this.fillColor,
    this.onTap,
    this.readOnly,
  });

  final TextEditingController controller;
  final Widget icon;
  final String hint;
  void Function()? onTap;
  bool? readOnly;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        readOnly: readOnly ?? false,
        onTap: onTap,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          prefixIcon: icon,

          hintText: hint,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12),
              bottom: Radius.circular(12),
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
