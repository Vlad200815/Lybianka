// import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lybianka/blocs/income_cubit/income_cubit.dart';
import 'package:lybianka/blocs/settings_bloc/theme_cubit/theme_cubit.dart';
import 'package:lybianka/features/add_money/widgets/widgets.dart';
import 'package:lybianka/blocs/category_bloc/category_bloc.dart';
import 'package:lybianka/blocs/money_bloc/money_bloc.dart';
import 'package:lybianka/repositories/graphic_repository/model/income_entry_model.dart';
import 'package:uuid/uuid.dart';
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
  bool isProfit = false;
  bool isExpanse = false;
  // Color colors = Color(4292352281);

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

  bool isProgress = false;
  final _formKey = GlobalKey<FormState>();
  int selectedBerry = 0;

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  void initState() {
    super.initState();
    String formttedDate = DateFormat('dd/MM/yyyy').format(now);
    _dateFieldController.text = formttedDate;
    if (context.read<ThemeCubit>().state.brightness == Brightness.dark) {
      pickerColor = Colors.black;
    }
  }

  void showBerryPickerDialog(BuildContext context) {
    final theme = Theme.of(context);
    int tempSelectedBerry = selectedBerry;
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return CupertinoAlertDialog(
              title: Text(
                "Іконки",
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              content: SizedBox(
                height: 175,
                child: GridView.builder(
                  itemCount: berries.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setDialogState(() {
                          tempSelectedBerry = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: tempSelectedBerry == index
                                  ? Colors.green
                                  : Colors.grey.shade300,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(berries[index], scale: 12),
                        ),
                      ),
                    );
                  },
                ),
              ),
              actions: [
                CupertinoButton(
                  onPressed: () {
                    setState(() {
                      selectedBerry = tempSelectedBerry;
                      _iconFieldController.text = berries[selectedBerry]
                          .substring(
                            berries[selectedBerry].lastIndexOf('/') + 1,
                            berries[selectedBerry].lastIndexOf('.'),
                          )
                          .replaceAll("_", " ");
                    });
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Вибрати",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                CupertinoButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Скасувати",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
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
              SizedBox(height: MediaQuery.of(context).size.height / 28),
              Text(
                "Додай гроші чи відніми",
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.green,
                            border: isProfit
                                ? Border.all(
                                    color: theme.colorScheme.onSurface,
                                    width: 3,
                                  )
                                : Border(),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isProfit = true;
                                isExpanse = false;
                              });
                            },
                            child: Center(
                              child: Text(
                                "+",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.red,
                            border: isExpanse
                                ? Border.all(
                                    color: theme.colorScheme.onSurface,
                                    width: 3,
                                  )
                                : Border(),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isProfit = false;
                                isExpanse = true;
                              });
                            },
                            child: Center(
                              child: Text(
                                "—",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 70),
                    MoneyTextField(moneyFieldController: _moneyFieldController),
                    SizedBox(height: MediaQuery.of(context).size.width / 9),
                    MyTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Впиши що робив(ла)";
                        }
                        return null; // valid
                      },
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
                        onTap: () => showBerryPickerDialog(context),
                        child: Icon(
                          Icons.expand_more,
                          color: theme.colorScheme.outline,
                        ),
                      ),
                      icon: Image.asset(berries[selectedBerry], scale: 15),
                    ),
                    MyTextField(
                      fillColor: pickerColor,
                      readOnly: true,
                      onTap: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            //TODO fix the problem with the cross inside ColorPicker
                            return SingleChildScrollView(
                              child: Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    16,
                                  ),
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
                                          debugPrint(
                                            "--------------------${pickerColor.value}-------------------------",
                                          );
                                          setState(
                                            () => currentColor = pickerColor,
                                          );
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
                    SizedBox(height: MediaQuery.of(context).size.height / 9),

                    BlocListener<CategoryBloc, CategoryState>(
                      listener: (context, state) {
                        if (state is SaveCategorySuccessState) {
                          Navigator.pop(context);
                        } else if (state is CategoryProgressState) {
                          isProgress = true;
                        } else {
                          debugPrint("ERROR");
                        }
                      },
                      child: isProgress == false
                          ? GradientButton(
                              onPressed: () async {
                                if (!isProfit && !isExpanse) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Оберіть дохід або витрату",
                                        style: TextStyle(
                                          color: theme.colorScheme.onSurface,
                                        ),
                                      ),
                                      backgroundColor:
                                          theme.colorScheme.onPrimary,
                                    ),
                                  );
                                  return;
                                }

                                if (_formKey.currentState!.validate()) {
                                  double? money = double.tryParse(
                                    _moneyFieldController.text,
                                  );
                                  if (money == null || money <= 0) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Некоректна сума",
                                          style: TextStyle(
                                            color: theme.colorScheme.onSurface,
                                          ),
                                        ),
                                        backgroundColor:
                                            theme.colorScheme.onPrimary,
                                      ),
                                    );
                                    return;
                                  }
                                  final String id = Uuid().v4();
                                  context.read<CategoryBloc>().add(
                                    OnSaveCategoryEvent(
                                      id: id,
                                      isProfit: isProfit,
                                      money: money,
                                      description: _whatJobFieldController.text,
                                      icon: berries[selectedBerry],
                                      color: pickerColor.value,
                                      date: _dateFieldController.text,
                                    ),
                                  );
                                  context.read<MoneyBloc>().add(
                                    OnSaveMoneyEvent(),
                                  );
                                  context.read<MoneyBloc>().add(
                                    OnGetMoneyEvent(),
                                  );

                                  if (isProfit) {
                                    context.read<IncomeCubit>().saveIncomeEntry(
                                      IncomeEntry(date: now, amount: money),
                                    );
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.white,
                                      content: Text(
                                        "Будь ласка, заповніть всі поля",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  );
                                }
                              },
                            )
                          : const Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
