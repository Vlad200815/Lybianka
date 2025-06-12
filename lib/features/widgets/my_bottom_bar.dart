import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lybianka/features/home/view/view.dart';
import 'package:lybianka/features/settings/settings.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add_money");
        },
        shape: const CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.tertiary,
                theme.colorScheme.secondary,
                theme.colorScheme.primary,
              ],
              transform: const GradientRotation(pi / 4),
            ),
          ),
          child: const Icon(CupertinoIcons.add),
        ),
      ),
      body: _selectedIndex == 0 ? HomeScreen() : SettingsScreen(),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              label: "Settings",
              icon: Icon(Icons.settings),
              backgroundColor: Colors.black,
            ),
          ],
          onTap: _onItemTapped,
          selectedItemColor: theme.colorScheme.primary,
          currentIndex: _selectedIndex,

          elevation: 3,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          backgroundColor: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
