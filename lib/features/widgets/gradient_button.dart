import 'dart:math';

import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.tertiary,
              theme.colorScheme.secondary,
              theme.colorScheme.primary,
            ],
            transform: const GradientRotation(pi / 4),
          ),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            "SAVE",
            style: TextStyle(
              color: theme.colorScheme.onPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
