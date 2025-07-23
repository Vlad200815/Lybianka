import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade100,
    onSurface: Colors.black,
    primary: const Color(0xFF00B2E7),
    secondary: const Color(0xFFE064F7),
    tertiary: const Color(0xFFFF8D6C),
    outline: Colors.grey,
    onPrimary: Colors.white,
    onSecondary: Color.fromARGB(255, 232, 249, 254),
  ),
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 33, 33, 33),
    onSurface: Colors.white,
    primary: const Color(0xFF00B2E7),
    secondary: const Color(0xFFE064F7),
    tertiary: const Color(0xFFFF8D6C),
    outline: Colors.grey,
    onPrimary: Colors.black,
    onSecondary: Colors.black,
  ),
);
