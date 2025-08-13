import 'package:flutter/material.dart';
import 'package:lybianka/features/intro/view/intro_disclaimer_screen.dart';
import 'package:lybianka/features/intro/view/intro_info_screen.dart';
import 'package:lybianka/features/intro/view/intro_starting_screen.dart';
import 'package:lybianka/features/settings/view/screamer2_screen.dart';
import 'package:lybianka/features/settings/view/screamer_screen.dart';
import '../features/add_money/add_money.dart';
import '../features/advise/advise.dart';
import '../features/history/history.dart';
import '../features/set_aim/set_aim.dart';
import '../features/settings/settings.dart';
import '../features/widgets/widgets.dart';

String? initialRoute = "/";

Map<String, Widget Function(BuildContext)> routes = {
  "/": (context) => const IntroStartingScreen(),
  "/info": (context) => const IntroInfoScreen(),
  "/disclaimer": (context) => const IntroDisclaimerScreen(),

  "/home": (context) => const MyBottomBar(),
  "/history": (context) => const HistoryScreen(),
  "/add_money": (context) => const AddMoneyScreen(),
  "/settings": (context) => const SettingsScreen(),
  "/settings/edit_profile": (context) => const EditProfileScreen(),
  "/settings/screamer": (context) => const ScreamerScreen(),
  "/settings/screamer2": (context) => const Screamer2Screen(),
  "/advise": (context) => const AdviseScreen(),
  "/set_aim": (context) => const SetAimScreen(),
};
