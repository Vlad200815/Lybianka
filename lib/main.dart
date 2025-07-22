import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lybianka/features/blocs/category_bloc/category_bloc.dart';
import 'package:lybianka/features/blocs/money_bloc/money_bloc.dart';
import 'package:lybianka/repositories/category_repository/category_repository_export.dart';
import 'package:lybianka/router/router.dart';
import 'package:lybianka/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker/talker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final talker = Talker();
  Bloc.observer = TalkerBlocObserver(talker: talker);

  final preferences = await SharedPreferences.getInstance();
  final categoryRepository = CategoryRepository(preferences: preferences);

  //for cleaning shared preferences if needed
  await preferences.clear();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CategoryBloc(categoryRepository: categoryRepository),
        ),
        BlocProvider(
          create: (context) => MoneyBloc(categoryRepo: categoryRepository),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
