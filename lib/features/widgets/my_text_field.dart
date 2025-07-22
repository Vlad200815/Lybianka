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
    this.suffixIcon,
    this.validator,
    this.keyboardType,
  });

  final TextEditingController controller;
  final Widget icon;
  final String hint;
  void Function()? onTap;
  bool? readOnly;
  final Color fillColor;
  Widget? suffixIcon;
  String? Function(String?)? validator;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        readOnly: readOnly ?? false,
        onTap: onTap,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          prefixIcon: icon,
          suffixIcon: suffixIcon,
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
