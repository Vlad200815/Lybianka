import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lybianka/blocs/category_bloc/category_bloc.dart';
import '../history.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    context.read<CategoryBloc>().add(OnGetCategoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text(
            "History",
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
      body: BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {
          if (state is RemoveCategorySuccessState) {
            context.read<CategoryBloc>().add(OnGetCategoryEvent());
          }
        },
        builder: (context, state) {
          return BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is GetCategorySuccessState) {
                final category = state.categories;
                return ListView.builder(
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Color(category[index].color),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Image.asset(
                                      category[index].icon,
                                      scale: 10,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 25,
                                ),
                                Center(
                                  child: SizedBox(
                                    width: 80,
                                    child: Text(
                                      category[index].description,
                                      overflow: TextOverflow
                                          .ellipsis, // or .fade, .clip
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: theme.colorScheme.onSurface,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        category[index].isProfit
                                            ? "+${category[index].money.floor()}₴"
                                            : "-${category[index].money.floor()}₴",
                                        style: TextStyle(
                                          color: category[index].isProfit
                                              ? Colors.green
                                              : Colors.red,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        category[index].date,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        240,
                                        250,
                                        255,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        showCupertinoDialog(
                                          context: context,
                                          builder: (cont) {
                                            return SizedBox(
                                              height: 100,
                                              width: 100,
                                              child: CupertinoAlertDialog(
                                                content: MenuOptions(
                                                  id: category[index].id,
                                                ),
                                                actions: [
                                                  IconButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    icon: Icon(
                                                      Icons.close_sharp,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(Icons.more_vert),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (state is CategoryProgressState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetCategorySuccessState &&
                  state.categories.isEmpty) {
                return const Center(
                  child: Text(
                    "Add some earnings or expanses",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                );
              } else if (state is CategoryFailureState) {
                return Center(
                  child: Text(
                    state.errorMessage.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          );
        },
      ),
    );
  }
}
