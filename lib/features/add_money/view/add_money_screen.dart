import 'package:flutter/cupertino.dart';
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
  final TextEditingController _iconFieldController = TextEditingController();

  DateTime now = DateTime.now();

  Color pickerColor = Color.fromARGB(255, 255, 255, 255);
  Color currentColor = Color(0xff443a49);

  List<String> berries = [
    "assets/berries/strabbery.png",
    "assets/berries/blue_berries.png",
    "assets/berries/cherry.png",
    "assets/berries/chily.png",
    "assets/berries/cucumber.png",
    "assets/berries/green_apple.png",
    "assets/berries/mushroom.png",
    "assets/berries/pear.png",
    "assets/berries/pitch.png",
    "assets/berries/red_apple.png",
    "assets/berries/tomato.png",
    "assets/berries/banana.png",
  ];

  int selectedBerry = 0;

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
                fillColor: theme.colorScheme.onPrimary,
                hint: 'Вибери іконку',
                readOnly: true,
                controller: _iconFieldController,
                suffixIcon: GestureDetector(
                  onTap: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return CupertinoAlertDialog(
                              title: Text(
                                "Іконки",
                                style: TextStyle(
                                  color: theme.colorScheme.onSurface,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              content: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: SizedBox(
                                  height: 175,
                                  child: GridView.builder(
                                    itemCount: 12,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                        ),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            String path = berries[index];
                                            setState(() {
                                              selectedBerry = index;
                                              _iconFieldController.text = path
                                                  .substring(
                                                    path.lastIndexOf('/') + 1,
                                                    path.lastIndexOf('.'),
                                                  );
                                            });
                                          },
                                          child: Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: selectedBerry == index
                                                    ? Colors.green
                                                    : Colors.grey.shade300,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: const Color.fromARGB(
                                                255,
                                                232,
                                                249,
                                                254,
                                              ),
                                            ),
                                            child: Image.asset(
                                              berries[index],
                                              scale: 12,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              actions: [
                                CupertinoButton(
                                  onPressed: () {
                                    //TODO: saving logic
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Вибрати",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                CupertinoButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Скасувати",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Icon(
                    Icons.expand_more,
                    color: theme.colorScheme.outline,
                  ),
                ),
                icon: Image.asset(berries[selectedBerry], scale: 15),
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
              SizedBox(height: MediaQuery.of(context).size.height / 8),
              GradientButton(onPressed: () => Navigator.pop(context)),
            ],
          ),
        ),
      ),
    );
  }
}
