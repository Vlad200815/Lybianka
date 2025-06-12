import 'package:flutter/material.dart';
import 'package:lybianka/features/add_money/view/add_money_screen.dart';
import 'package:lybianka/features/widgets/my_bottom_bar.dart';
import 'features/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          surface: Colors.grey.shade100,
          onSurface: Colors.black,
          primary: const Color(0xFF00B2E7),
          secondary: const Color(0xFFE064F7),
          tertiary: const Color(0xFFFF8D6C),
          outline: Colors.grey,
          onPrimary: Colors.white,
        ),
      ),
      routes: {
        "/": (context) => const MyBottomBar(),
        "/all_graphics": (context) => const AllGraphicsScreen(),
        // "/settings": (context) => const SettingsScreen(),
        "/add_money": (context) => AddMoneyScreen(),
      },
      initialRoute: '/',
    );
  }
}
