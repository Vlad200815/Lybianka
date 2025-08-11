import 'package:flutter/material.dart';
import 'package:lybianka/features/intro/widgets/widgets.dart';
import 'package:lybianka/features/widgets/my_text_field.dart';

class IntroInfoScreen extends StatelessWidget {
  const IntroInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _formKey = GlobalKey<FormState>();

    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _moneyController = TextEditingController();

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 8),
              Center(
                child: GradientBox(
                  width: 300,
                  height: 300,
                  radius: 150,
                  child: Image.asset(
                    "assets/intro_icons/mid_ninji.png",
                    scale: 4,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Text(
                "Впиши ім'я та початковий капітал!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyTextField(
                      controller: _nameController,
                      icon: Icon(Icons.abc),
                      hint: "Впиши ім'я",
                      fillColor: Colors.white,
                    ),
                    MyTextField(
                      controller: _moneyController,
                      icon: Icon(Icons.abc),
                      hint: "Впиши гроші",
                      fillColor: Colors.white,
                    ),
                  ],
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
                    onTap: () => Navigator.pushNamed(context, "/disclaimer"),
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
      ),
    );
  }
}
