import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../history.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

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
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: theme.colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.asset("assets/berries/strabbery.png"),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 18),
                  Center(
                    child: Text(
                      "Клубніка",
                      style: TextStyle(
                        color: theme.colorScheme.onSurface,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "+ 1000₴",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "2025/09/11",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
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
                        color: const Color.fromARGB(255, 240, 250, 255),
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
                                  content: MenuOptions(),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
