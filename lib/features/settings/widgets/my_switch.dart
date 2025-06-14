import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySwitch extends StatelessWidget {
  final String text;
  final bool value;
  final void Function(bool)? onChanged;

  const MySwitch({
    required this.text,
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(width: 50),
            CupertinoSwitch(value: value, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}
