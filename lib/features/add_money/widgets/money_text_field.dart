import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoneyTextField extends StatelessWidget {
  const MoneyTextField({super.key, required this.moneyFieldController, r});

  final TextEditingController moneyFieldController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: moneyFieldController,
        textAlignVertical: TextAlignVertical.center,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Впиши гроші";
          }
          return null; // valid
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(
            FontAwesomeIcons.hryvniaSign,
            size: 16,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
