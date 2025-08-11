import 'package:flutter/material.dart';
import 'package:lybianka/features/intro/widgets/widgets.dart';

class IntroDisclaimerScreen extends StatelessWidget {
  const IntroDisclaimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 8),
            Center(
              child: GradientBox(
                width: 300,
                height: 300,
                radius: 150,
                child: Image.asset(
                  "assets/intro_icons/demon_ninji.png",
                  scale: 4.5,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 43,
                  child: Image.asset(
                    "assets/intro_icons/blood.webp",
                    scale: 10,
                  ),
                ),
                Text(
                  "Дисклеймер!",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "Не лякайся різких вискакуючих скрімерів, це зроблено тільки для розважальних цілей. Тому будь готовий до цього!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[500],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    GradientBox(
                      height: 7,
                      radius: 0,
                      width: 50,
                      child: SizedBox(),
                    ),
                    const SizedBox(width: 8),
                    GradientBox(
                      height: 7,
                      radius: 0,
                      width: 50,
                      child: SizedBox(),
                    ),
                    const SizedBox(width: 8),
                    GradientBox(
                      height: 7,
                      radius: 0,
                      width: 50,
                      child: SizedBox(),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "/home"),
                  child: GradientBox(
                    height: 50,
                    radius: 0,
                    width: 100,
                    child: Center(
                      child: Text(
                        "Далі",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
