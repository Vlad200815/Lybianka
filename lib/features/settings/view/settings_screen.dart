import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkThemeSwitch = false;
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
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 232, 249, 254),
          title: Text(
            "Settings",
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
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/settings/edit_profile",
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(
                              color: theme.colorScheme.tertiary,
                              width: 3,
                            ),
                            color: Colors.red,
                          ),
                          child: Image.asset(
                            "assets/appearences/man.png",
                            scale: 6,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Vlad Semeniuk",
                            style: TextStyle(
                              color: theme.colorScheme.onSurface,
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "@svg110308",
                            style: TextStyle(
                              color: theme.colorScheme.outline,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              MySwitch(
                text: "Dark Theme",
                value: darkThemeSwitch,
                onChanged: (value) {
                  setState(() {
                    darkThemeSwitch = value;
                  });
                },
              ),
              MySwitch(
                text: "Notifications",
                value: notificationSwitch,
                onChanged: (value) {
                  setState(() {
                    notificationSwitch = value;
                  });
                },
              ),
              MySwitch(
                text: "Allow Analitics",
                value: allowAnalitics,
                onChanged: (value) {
                  setState(() {
                    allowAnalitics = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              MyTile(
                icon: Icon(Icons.door_front_door, color: Colors.red, size: 30),
                text: "Sign Out",
                onPressed: () {
                  //TODO: Sign out logic
                },
              ),
              MyTile(
                icon: Icon(Icons.telegram, color: Colors.blue, size: 30),
                text: "Report a Bug",
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
