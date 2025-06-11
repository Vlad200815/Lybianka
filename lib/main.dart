import 'package:flutter/material.dart';
import 'package:lybianka/features/add_money/view/add_money_screen.dart';

import 'features/home/home.dart';
import 'features/settings/settings.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        "/": (context) => const HomeScreen(),
        "/all_graphics": (context) => const AllGraphicsScreen(),
        "/settings": (context) => const SettingsScreen(),
        "/add_money": (context) => const AddMoneyScreen(),
      },
      initialRoute: '/',
    );
  }
}
