import 'package:flutter/material.dart';
import 'package:lybianka/features/advise/views/advise_screen.dart';
import 'package:lybianka/features/set_aim/views/set_aim_screen.dart';
import 'package:lybianka/theme/theme.dart';
import 'features/add_money/add_money.dart';
import 'features/history/history.dart';
import 'features/settings/settings.dart';
import 'features/widgets/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      routes: {
        "/": (context) => const MyBottomBar(),
        "/history": (context) => const HistoryScreen(),
        "/add_money": (context) => AddMoneyScreen(),
        "/settings": (context) => const SettingsScreen(),
        "/settings/edit_profile": (context) => const EditProfileScreen(),
        "/advise": (context) => const AdviseScreen(),
        "/set_aim": (context) => const SetAimScreen(),
      },
      initialRoute: '/',
    );
  }
}
