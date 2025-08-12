import 'package:flutter/material.dart';
import 'package:lybianka/features/intro/widgets/widgets.dart';

class IntroStartingScreen extends StatelessWidget {
  const IntroStartingScreen({super.key});

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
                  "assets/intro_icons/angel_ninji.png",
                  scale: 4,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Text(
              "MoneyTracker — твій нані друг!",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "Тут ти зможеш слідкувати за своїми грошми, крутируй і зрозумілий інтерфейл з графіком на цілий тиждень, моживість стлізувати свій профіль і навіть більше!",
                style: TextStyle(
                  fontSize: 18,
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
                    Container(color: Colors.grey[300], width: 50, height: 7),
                    const SizedBox(width: 8),
                    Container(color: Colors.grey[300], width: 50, height: 7),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "/info"),
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
