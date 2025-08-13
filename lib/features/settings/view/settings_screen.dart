import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lybianka/blocs/intro_bloc/intro_bloc.dart';
import 'package:lybianka/blocs/settings_bloc/settings_bloc.dart';
import 'package:lybianka/blocs/settings_bloc/theme_cubit/theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationSwitch = true;
  bool allowAnalitics = true;

  final Uri url = Uri.parse("https://web.telegram.org/k/#@VladSemeniukPr");

  Future<void> launchTelegramUrl() async {
    if (!await launchUrl(url)) {
      throw Exception("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          leading: SizedBox(),
          elevation: 0,
          backgroundColor: theme.colorScheme.onSecondary,
          title: Text(
            "Налаштування",
            style: TextStyle(
              color: theme.colorScheme.onSurface,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: theme.colorScheme.onPrimary,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/settings/edit_profile",
                          );
                        },
                        child: BlocBuilder<SettingsBloc, SettingsState>(
                          builder: (context, state) {
                            if (state is SettingsGetSuccessState) {
                              return Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  border: Border.all(
                                    color: Color(state.profileModel.border),
                                    width: 3,
                                  ),
                                  color: Color(state.profileModel.background),
                                ),
                                child: Image.asset(
                                  state.profileModel.avatar,
                                  scale: 6,
                                ),
                              );
                            } else {
                              return SizedBox();
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 15),

                      BlocBuilder<IntroBloc, IntroState>(
                        builder: (context, state) {
                          if (state is IntroGetNameSuccessState) {
                            return Center(
                              child: Text(
                                state.name,
                                style: TextStyle(
                                  color: theme.colorScheme.onSurface,
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          } else if (state is IntroProgressState) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return Text(
                              "User",
                              style: TextStyle(
                                color: theme.colorScheme.onSurface,
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return MySwitch(
                    text: "Чорна тема",
                    value: state.brightness == Brightness.dark ? true : false,
                    onChanged: (value) {
                      setState(() {
                        context.read<ThemeCubit>().setThemeBrightness(
                          value ? Brightness.dark : Brightness.light,
                        );
                      });
                    },
                  );
                },
              ),
              MySwitch(
                text: "Повідомлення",
                value: notificationSwitch,
                onChanged: (value) {
                  setState(() {
                    notificationSwitch = value;
                    Navigator.pushNamed(context, "/settings/screamer");
                  });
                },
              ),
              MySwitch(
                text: "Нотиіфкації",
                value: allowAnalitics,
                onChanged: (value) {
                  setState(() {
                    allowAnalitics = value;
                    Navigator.pushNamed(context, "/settings/screamer2");
                  });
                },
              ),
              const SizedBox(height: 10),
              MyTile(
                icon: Icon(Icons.door_front_door, color: Colors.red, size: 30),
                text: "Видалити все",
                onPressed: () async {
                  final preferences = await SharedPreferences.getInstance();
                  await preferences.clear();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/',
                    (Route<dynamic> route) => false,
                  );
                },
              ),
              MyTile(
                icon: Icon(Icons.telegram, color: Colors.blue, size: 30),
                text: "Повідомити про баг",
                onPressed: () async {
                  await launchUrl(url);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
