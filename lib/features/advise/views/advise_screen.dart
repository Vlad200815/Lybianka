import 'dart:math';

import 'package:flutter/material.dart';

class AdviseScreen extends StatelessWidget {
  const AdviseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text(
            "Advice",
            style: TextStyle(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.chevron_left_sharp,
              color: theme.colorScheme.outline,
              size: 30,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.tertiary,
                      theme.colorScheme.secondary,
                      theme.colorScheme.primary,
                    ],
                    transform: const GradientRotation(pi / 1),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        "'Не заощаджуйте те, що залишилося після витрат. Витрачайте те, що залишилося після заощаджень'",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width / 35),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "— Воррен Баффет",
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.tertiary,
                      theme.colorScheme.secondary,
                      theme.colorScheme.primary,
                    ],
                    transform: const GradientRotation(pi / 2),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        "'Багаті купують активи. Бідні купують зобов’язання, думаючи, що це активи.'",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width / 35),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "— Роберт Кійосакі",
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.tertiary,
                      theme.colorScheme.secondary,
                      theme.colorScheme.primary,
                    ],
                    transform: const GradientRotation(pi / 3),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        "'Все, що розум людини може уявити й у що може повірити — він може досягти.'",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width / 35),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "— Наполеон Гілл",
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.tertiary,
                      theme.colorScheme.secondary,
                      theme.colorScheme.primary,
                    ],
                    transform: const GradientRotation(pi / 4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        "'Не фокусуйтесь на грошах. Фокусуйтесь на створенні чогось цінного.'",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width / 35),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "— Елон Маск",
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.tertiary,
                      theme.colorScheme.secondary,
                      theme.colorScheme.primary,
                    ],
                    transform: const GradientRotation(pi / 4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        "'Інвестуй у великі ідеї, навіть якщо це вимагає ризику та тимчасового дискомфорту.'",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width / 35),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "— Джон Д. Рокфеллер",
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.tertiary,
                      theme.colorScheme.secondary,
                      theme.colorScheme.primary,
                    ],
                    transform: const GradientRotation(pi / 4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        "'Будьте пристрасними у тому, що робите, і гроші прийдуть самі.'",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width / 35),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "— Річард Бренсон",
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.tertiary,
                      theme.colorScheme.secondary,
                      theme.colorScheme.primary,
                    ],
                    transform: const GradientRotation(pi / 4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        "'Довгострокова перспектива важливіша за короткостроковий прибуток. Терпіння винагороджується.'",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width / 35),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "— Джефф Безос",
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),

              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.tertiary,
                      theme.colorScheme.secondary,
                      theme.colorScheme.primary,
                    ],
                    transform: const GradientRotation(pi / 4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        "'Фінансова свобода починається з контролю над власними витратами і звичками.'",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width / 35),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "— Тоні Роббінс",
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),

              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.tertiary,
                      theme.colorScheme.secondary,
                      theme.colorScheme.primary,
                    ],
                    transform: const GradientRotation(pi / 4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        "'Інновації створюють багатство. Думайте про проблеми людей і вирішуйте їх.'",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width / 35),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "— Білл Гейтс",
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.tertiary,
                      theme.colorScheme.secondary,
                      theme.colorScheme.primary,
                    ],
                    transform: const GradientRotation(pi / 4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        "'Не вкладайтеся в те, чого не розумієте. Розуміння ризику — ключ до багатства.'",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width / 35),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "— Кен Хенсон",
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
