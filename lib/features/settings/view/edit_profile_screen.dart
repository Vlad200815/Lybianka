import 'package:flutter/material.dart';
import 'package:lybianka/features/widgets/widgets.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  List<String> faces = [
    "assets/appearences/person.png",
    "assets/appearences/bearded_woman.png",
    "assets/appearences/blond_man.png",
    "assets/appearences/blond_woman.png",
    "assets/appearences/bride.png",
    "assets/appearences/man.png",
    "assets/appearences/curly_man.png",
    "assets/appearences/curly_woman.png",
    "assets/appearences/dancer.png",
    "assets/appearences/girl.png",
    "assets/appearences/grey_haired_man.png",
    "assets/appearences/hand.png",
    "assets/appearences/lion.png",
    "assets/appearences/ninji.png",
    "assets/appearences/programmer.png",
    "assets/appearences/queen.png",
    "assets/appearences/unicorn.png",
    "assets/appearences/whale.png",
    "assets/appearences/wolf.png",
    "assets/appearences/gorila.png",
    // "assets/appearences/ukraine.png",
    // "assets/appearences/poland.png",
    // "assets/appearences/baby.png",
    // "assets/appearences/angel.png",
    // "assets/appearences/finger.png",
  ];

  List<Color> backgroundColors = [
    Colors.redAccent,
    const Color(0xFF00B2E7),
    Colors.lightGreenAccent,
    Colors.black,
    Color(0xFFE064F7),
    Color(0xFFFF8D6C),
  ];

  List<Color> borderColors = [
    Colors.redAccent,
    const Color(0xFF00B2E7),
    Colors.lightGreenAccent,
    Colors.black,
    Color(0xFFE064F7),
    Color(0xFFFF8D6C),
  ];

  int selectedFace = 0;
  int selectedBackgroundColor = 0;
  int selectedBorderColor = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 232, 249, 254),
        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.42,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: theme.colorScheme.onPrimary,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(75),
                          border: Border.all(
                            color: borderColors[selectedBorderColor],
                            width: 3,
                          ),
                          color: backgroundColors[selectedBackgroundColor],
                        ),
                        child: Image.asset(faces[selectedFace], scale: 6),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Avatar",
                        style: TextStyle(
                          color: theme.colorScheme.onSurface,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                              ),
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedFace = index;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      232,
                                      249,
                                      254,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: selectedFace == index
                                          ? Colors.green
                                          : Colors.grey,
                                      width: 2,
                                    ),
                                  ),
                                  child: Image.asset(faces[index], scale: 5),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Background",
                        style: TextStyle(
                          color: theme.colorScheme.onSurface,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Wrap(
                        spacing: 5,
                        runSpacing: 10,
                        children: List.generate(backgroundColors.length, (
                          index,
                        ) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedBackgroundColor = index;
                              });
                            },
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: backgroundColors[index],
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: selectedBackgroundColor == index
                                      ? Colors.green
                                      : Colors.grey.shade300,
                                  width: 2,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Border",
                        style: TextStyle(
                          color: theme.colorScheme.onSurface,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Wrap(
                        spacing: 5,
                        runSpacing: 10,
                        children: List.generate(borderColors.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedBorderColor = index;
                              });
                            },
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: borderColors[index],
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: selectedBorderColor == index
                                      ? Colors.green
                                      : Colors.grey.shade300,
                                  width: 2,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width / 25),
              GradientButton(
                onPressed: () {
                  //TODO: saveing logic
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
