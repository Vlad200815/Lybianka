import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lybianka/features/intro/widgets/widgets.dart';
import 'package:lybianka/features/widgets/my_text_field.dart';

class IntroInfoScreen extends StatefulWidget {
  const IntroInfoScreen({super.key});

  @override
  State<IntroInfoScreen> createState() => _IntroInfoScreenState();
}

class _IntroInfoScreenState extends State<IntroInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _moneyController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _moneyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Впиши ім'я";
                        }
                        return null;
                      },
                      controller: _nameController,
                      icon: Icon(Icons.person),
                      hint: "Впиши ім'я",
                      fillColor: theme.colorScheme.onPrimary,
                    ),
                    MyTextField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Впиши гроші";
                        }
                        return null;
                      },
                      controller: _moneyController,
                      icon: Icon(FontAwesomeIcons.hryvniaSign),
                      hint: "Впиши гроші",
                      fillColor: theme.colorScheme.onPrimary,
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
                      Container(color: Colors.grey[300], width: 50, height: 7),
                      const SizedBox(width: 8),
                      GradientBox(
                        height: 7,
                        radius: 0,
                        width: 50,
                        child: SizedBox(),
                      ),
                      const SizedBox(width: 8),
                      Container(color: Colors.grey[300], width: 50, height: 7),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        double? money = double.tryParse(_moneyController.text);
                        if (money == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Некоректна сума",
                                style: TextStyle(
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                              backgroundColor: theme.colorScheme.onPrimary,
                            ),
                          );
                          return;
                        }
                        Navigator.pushNamed(context, "/disclaimer");
                      }
                    },
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
