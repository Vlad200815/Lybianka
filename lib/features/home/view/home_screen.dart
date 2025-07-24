import 'dart:io';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:lybianka/blocs/aim_category_bloc/aim_category_bloc.dart';
import 'package:lybianka/blocs/income_cubit/income_cubit.dart';
import 'package:lybianka/blocs/money_bloc/money_bloc.dart';
import 'package:lybianka/blocs/settings_bloc/settings_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = FlipCardController();

  DateTime _selectedDate = DateTime.now();
  File? _image;

  void loadImage() async {
    final String fileName = "the_image.jpg";
    final String path = (await getApplicationDocumentsDirectory()).path;

    if (File("$path/$fileName").existsSync()) {
      setState(() {
        _image = File("$path/$fileName");
      });
      print("---------------------------reloads-----------------------------");
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<MoneyBloc>().add(OnGetMoneyEvent());
    context.read<SettingsBloc>().add(OnGetProfileEvent());
    context.read<AimCategoryBloc>().add(OnGetAimCategoryEvent());
    loadImage();
    // context.read<IncomeCubit>().loadWeekData();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  BlocBuilder<SettingsBloc, SettingsState>(
                    builder: (context, state) {
                      if (state is SettingsGetSuccessState) {
                        return Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(state.profileModel.background),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Color(state.profileModel.border),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              state.profileModel.avatar,
                              height: 35,
                            ),
                          ),
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome!",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 148, 148, 148),
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Vlad Semeniuk",
                        style: TextStyle(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.w800,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 3.5),
                  IconButton(
                    onPressed: () => Navigator.pushNamed(context, "/advise"),
                    icon: Icon(Icons.lightbulb, color: Colors.yellow, size: 30),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 45),
              BlocBuilder<MoneyBloc, MoneyState>(
                builder: (context, state) {
                  if (state is MoneyGetSuccessState) {
                    num money = state.money.floor();
                    return FlipCard(
                      controller: controller,
                      rotateSide: RotateSide.right,
                      axis: FlipAxis.vertical,
                      onTapFlipping: true,
                      frontWidget: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              theme.colorScheme.tertiary,
                              theme.colorScheme.secondary,
                              theme.colorScheme.primary,
                            ],
                            transform: const GradientRotation(pi / 4),
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Total Balance",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "₴${state.money.floor()}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 45,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      backWidget: BlocBuilder<AimCategoryBloc, AimCategoryState>(
                        builder: (context, state) {
                          if (state is AimCategoryGetSuccessState) {
                            int percentage =
                                ((money / state.aimCategory.price) * 100)
                                    .round();
                            double percent = money / state.aimCategory.price;
                            if (percent >= 1 || percentage >= 100) {
                              percent = 1;
                              percentage = 100;
                            }
                            return Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      state.aimCategory.name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                      ),
                                    ),
                                    const SizedBox(height: 2.5),
                                    CircularPercentIndicator(
                                      curve: Curves.easeInCubic,

                                      radius: 50,
                                      lineWidth: 8,
                                      percent: percent,
                                      progressColor: const Color.fromARGB(
                                        255,
                                        255,
                                        0,
                                        85,
                                      ),
                                      backgroundColor: Colors.redAccent,
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                      center: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                    255,
                                                    154,
                                                    223,
                                                    255,
                                                  ),
                                              radius: 42.5,
                                              foregroundImage: _image != null
                                                  ? FileImage(_image!)
                                                  : null,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "$percentage%",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 2.5),

                                    Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "$money₴/${state.aimCategory.price}₴",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.of(
                                                context,
                                              ).size.width /
                                              5,
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: IconButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                context,
                                                "/set_aim",
                                              );
                                            },
                                            icon: Icon(
                                              Icons.outlined_flag_rounded,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Center(
                              child: CircularPercentIndicator(radius: 30),
                            );
                          }
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        "Something went wrong...",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    );
                  }
                },
              ),

              SizedBox(height: MediaQuery.of(context).size.height / 39),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Week Preformance",
                      style: TextStyle(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/history");
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ///Graph----------->>>>>>>>>>>>>>>>>>>>>>>>>>>>
              BlocBuilder<IncomeCubit, IncomeCubitState>(
                builder: (context, state) {
                  return Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    height: 320,
                    child: BarChart(
                      BarChartData(
                        borderData: FlBorderData(show: false),
                        barTouchData: BarTouchData(enabled: false),
                        maxY: 3000,
                        barGroups: List.generate(7, (index) {
                          return BarChartGroupData(
                            x: index,
                            barRods: [
                              BarChartRodData(
                                toY: state.weekData[index],
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  colors: [
                                    theme.colorScheme.tertiary,
                                    theme.colorScheme.secondary,
                                    theme.colorScheme.primary,
                                  ],
                                  transform: GradientRotation(pi / 40),
                                ),
                                width: 10,
                                fromY: 0,
                                backDrawRodData: BackgroundBarChartRodData(
                                  show: true,
                                  toY: 5,
                                  color: Colors.grey[300],
                                ),
                                color: (_selectedDate.weekday - 1) == index
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                            ],
                          );
                        }),
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                const days = [
                                  'Mo',
                                  'Tu',
                                  'We',
                                  'Th',
                                  'Fr',
                                  'Sa',
                                  'Su',
                                ];
                                return Text(
                                  days[value.toInt()],
                                  style: TextStyle(
                                    color: theme.colorScheme.outline,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
