
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lybianka/blocs/aim_category_bloc/aim_category_bloc.dart';
import 'package:lybianka/blocs/category_bloc/category_bloc.dart';
import 'package:lybianka/blocs/income_cubit/income_cubit.dart';
import 'package:lybianka/blocs/intro_bloc/intro_bloc.dart';
import 'package:lybianka/blocs/intro_bloc/is_intro_seen_cubit/is_seen_cubit.dart';
import 'package:lybianka/blocs/money_bloc/money_bloc.dart';
import 'package:lybianka/blocs/settings_bloc/settings_bloc.dart';
import 'package:lybianka/blocs/settings_bloc/theme_cubit/theme_cubit.dart';
import 'package:lybianka/repositories/aim_category/aim_category_repository.dart';
import 'package:lybianka/repositories/category_repository/category_repository_export.dart';
import 'package:lybianka/repositories/graphic_repository/graphic_repository.dart';
import 'package:lybianka/repositories/intro_repository/intro_repository.dart';
import 'package:lybianka/repositories/settings_repository/settings_repository.dart';
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
  final settingsRepository = SettingsRepository(prefs: preferences);
  final aimCategoryRepository = AimCategoryRepository(preferences: preferences);
  final graphicRepository = GraphicRepository(preferences: preferences);
  final introRepository = IntroRepository(prefs: preferences);

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
        BlocProvider(
          create: (context) => SettingsBloc(settingsRepo: settingsRepository),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(settingsRepo: settingsRepository),
        ),
        BlocProvider(
          create: (context) =>
              AimCategoryBloc(aimCategoryRepo: aimCategoryRepository),
        ),
        BlocProvider(
          create: (context) => IncomeCubit(graphicRepo: graphicRepository),
        ),
        BlocProvider(
          create: (context) =>
              IntroBloc(introRepo: introRepository)..add(OnIsSeenIntroEvent()),
        ),
        BlocProvider(
          create: (context) => IsSeenCubit(introRepo: introRepository),
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
    return BlocBuilder<IsSeenCubit, IsSeenState>(
      builder: (context, isSeenState) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeState.brightness == Brightness.light
                  ? lightTheme
                  : darkTheme,
              routes: routes,
              initialRoute: isSeenState.route,
            );
          },
        );
      },
    );
  }
}
