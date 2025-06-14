import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lybianka/features/add_money/widgets/widgets.dart';

import '../../widgets/widgets.dart';

class AddMoneyScreen extends StatefulWidget {
  const AddMoneyScreen({super.key});

  @override
  State<AddMoneyScreen> createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
  final TextEditingController _moneyFieldController = TextEditingController();
  final TextEditingController _whatJobFieldController = TextEditingController();
  final TextEditingController _dateFieldController = TextEditingController();
  final TextEditingController _colorFieldController = TextEditingController();

  DateTime now = DateTime.now();

  Color pickerColor = Color.fromARGB(255, 255, 255, 255);
  Color currentColor = Color(0xff443a49);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  void initState() {
    super.initState();
    String formttedDate = DateFormat('yyyy/MM/dd').format(now);
    _dateFieldController.text = formttedDate;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 30),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close_sharp,
                    color: theme.colorScheme.outline,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 12),
              Text(
                "Додай гроші",
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              MoneyTextField(moneyFieldController: _moneyFieldController),
              SizedBox(height: MediaQuery.of(context).size.width / 9),
              MyTextField(
                fillColor: theme.colorScheme.onPrimary,
                hint: 'Що збирав',
                controller: _whatJobFieldController,
                icon: const Icon(
                  FontAwesomeIcons.list,
                  size: 16,
                  color: Colors.grey,
                ),
              ),
              MyTextField(
                fillColor: pickerColor,
                onTap: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      //TODO fix the problem with the cross inside ColorPicker
                      return SingleChildScrollView(
                        child: Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(16),
                          ),
                          child: Padding(
                            padding: EdgeInsetsGeometry.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Pick a color!',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 16),
                                ColorPicker(
                                  pickerColor: pickerColor,
                                  onColorChanged: changeColor,
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  child: const Text('Got it'),
                                  onPressed: () {
                                    setState(() => currentColor = pickerColor);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                controller: _colorFieldController,
                hint: 'Колір',
                icon: const Icon(
                  FontAwesomeIcons.pencil,
                  size: 16,
                  color: Colors.grey,
                ),
              ),
              MyTextField(
                fillColor: theme.colorScheme.onPrimary,
                readOnly: true,
                controller: _dateFieldController,
                hint: 'Дата',
                icon: const Icon(
                  FontAwesomeIcons.clock,
                  size: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 6),
              GradientButton(onPressed: () => Navigator.pop(context)),
            ],
          ),
        ),
      ),
    );
  }
}
