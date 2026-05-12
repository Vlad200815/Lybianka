// import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lybianka/blocs/category_bloc/category_bloc.dart';
import 'package:lybianka/blocs/income_cubit/income_cubit.dart';
import 'package:lybianka/blocs/money_bloc/money_bloc.dart';
import 'package:lybianka/blocs/settings_bloc/theme_cubit/theme_cubit.dart';
import 'package:lybianka/features/add_money/widgets/widgets.dart';
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

  Color _pickerColor = Color.fromARGB(255, 255, 255, 255);
  Color _currentColor = Color(0xff443a49);
  bool _isProfit = false;
  bool _isExpanse = false;

  final String DATE_FORMAT_TYPE = 'dd/MM/yyyy';

  final List<String> _categories = [
    "assets/categories/money.png",
    "assets/categories/strawberry.png",
    "assets/categories/pitch.png",
    "assets/categories/banana.png",
    "assets/categories/love.png",
    "assets/categories/nails.png",
    // "assets/categories/teaching.png",
    "assets/categories/travel.png",
    "assets/categories/cart.png",
    "assets/categories/casino.png",
    "assets/categories/key.png",
    "assets/categories/mountain.png",
  ];

  bool isProgress = false;
  final _formKey = GlobalKey<FormState>();
  int _selectedCategory = 0;

  void changeColor(Color color) => setState(() => _pickerColor = color);

  @override
  void initState() {
    super.initState();
    final String formatedDate = DateFormat(DATE_FORMAT_TYPE).format(now);
    _dateFieldController.text = formatedDate;
    if (context.read<ThemeCubit>().state.brightness == Brightness.dark) {
      _pickerColor = Colors.black;
    }
  }

  @override
  void dispose() {
    _moneyFieldController.dispose();
    _whatJobFieldController.dispose();
    _dateFieldController.dispose();
    _colorFieldController.dispose();
    _iconFieldController.dispose();
    super.dispose();
  }

  void showBerryPickerDialog(BuildContext context) {
    final theme = Theme.of(context);
    int tempSelectedBerry = _selectedCategory;
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
                  itemCount: _categories.length,
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
                          child: Image.asset(_categories[index], scale: 12),
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
                      _selectedCategory = tempSelectedBerry;
                      _iconFieldController.text = _categories[_selectedCategory]
                          .substring(
                            _categories[_selectedCategory].lastIndexOf('/') + 1,
                            _categories[_selectedCategory].lastIndexOf('.'),
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
                            border: _isProfit
                                ? Border.all(
                                    color: theme.colorScheme.onSurface,
                                    width: 3,
                                  )
                                : Border(),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isProfit = true;
                                _isExpanse = false;
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
                            border: _isExpanse
                                ? Border.all(
                                    color: theme.colorScheme.onSurface,
                                    width: 3,
                                  )
                                : Border(),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isProfit = false;
                                _isExpanse = true;
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
                      icon: Image.asset(
                        _categories[_selectedCategory],
                        scale: 15,
                      ),
                    ),
                    MyTextField(
                      fillColor: _pickerColor,
                      readOnly: true,
                      onTap: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
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
                                        pickerColor: _pickerColor,
                                        onColorChanged: changeColor,
                                      ),
                                      const SizedBox(height: 16),
                                      ElevatedButton(
                                        child: const Text('Got it'),
                                        onPressed: () {
                                          debugPrint(
                                            "--------------------${_pickerColor.toARGB32()}-------------------------",
                                          );
                                          setState(
                                            () => _currentColor = _pickerColor,
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
                                if (!_isProfit && !_isExpanse) {
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
                                      isProfit: _isProfit,
                                      money: money,
                                      description: _whatJobFieldController.text,
                                      icon: _categories[_selectedCategory],
                                      color: _pickerColor.toARGB32(),
                                      date: _dateFieldController.text,
                                    ),
                                  );
                                  context.read<MoneyBloc>().add(
                                    OnSaveMoneyEvent(),
                                  );
                                  context.read<MoneyBloc>().add(
                                    OnGetMoneyEvent(),
                                  );

                                  if (_isProfit) {
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
