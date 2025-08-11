import 'dart:math';

import 'package:flutter/material.dart';

class GradientBox extends StatelessWidget {
  const GradientBox({
    super.key,
    required this.height,
    required this.radius,
    required this.width,
    required this.child,
  });

  final double height;
  final double width;
  final double radius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.tertiary,
            theme.colorScheme.secondary,
            theme.colorScheme.primary,
          ],
          transform: const GradientRotation(pi / 4),
        ),
      ),
      child: child,
    );
  }
}
