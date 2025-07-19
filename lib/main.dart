import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lybianka/router/router.dart';
import 'package:lybianka/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      routes: routes,
      initialRoute: initialRoute,
    );
  }
}
