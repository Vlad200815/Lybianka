import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Widget icon;

  const MyTile({
    required this.icon,
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: onPressed,
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
              icon,
            ],
          ),
        ),
      ),
    );
  }
}
