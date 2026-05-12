import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lybianka/blocs/settings_bloc/settings_bloc.dart';
import 'package:lybianka/features/widgets/widgets.dart';
import 'package:lybianka/repositories/settings_repository/model/model.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final List<String> _avatars = [
    "assets/appearences/person.png",
    "assets/appearences/bearded_woman.png",
    "assets/appearences/blond_woman.png",
    "assets/appearences/bride.png",
    "assets/appearences/dancer.png",
    "assets/appearences/hand.png",
    "assets/appearences/lion.png",
    "assets/appearences/ninji.png",
    "assets/appearences/programmer.png",
    "assets/appearences/queen.png",
    "assets/appearences/unicorn.png",
    "assets/appearences/whale.png",
    "assets/appearences/wolf.png",
    "assets/appearences/gorilla.png",
    "assets/appearences/finger.png",
    "assets/appearences/alien.png",
    "assets/appearences/clone.png",
    "assets/appearences/devel.png",
    "assets/appearences/frozen.png",
    "assets/appearences/hot.png",
  ];

  final List<Color> _profileColors = [
    Colors.redAccent,
    const Color(0xFF00B2E7),
    Colors.lightGreenAccent,
    Colors.black,
    const Color(0xFFE064F7),
    const Color(0xFFFF8D6C),
  ];

  int _selectedAvatarIndex = 0;
  int _selectedBackgroundColorIndex = 0;
  int _selectedBorderColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.colorScheme.onSecondary,
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
                            color: _profileColors[_selectedBorderColorIndex],
                            width: 3,
                          ),
                          color: _profileColors[_selectedBackgroundColorIndex],
                        ),
                        child: Image.asset(
                          _avatars[_selectedAvatarIndex],
                          scale: 6,
                        ),
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
                                    _selectedAvatarIndex = index;
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
                                      color: _selectedAvatarIndex == index
                                          ? Colors.green
                                          : Colors.grey,
                                      width: 2,
                                    ),
                                  ),
                                  child: Image.asset(_avatars[index], scale: 5),
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
                        children: List.generate(_profileColors.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedBackgroundColorIndex = index;
                              });
                            },
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: _profileColors[index],
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: _selectedBackgroundColorIndex == index
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
                        children: List.generate(_profileColors.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedBorderColorIndex = index;
                              });
                            },
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: _profileColors[index],
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: _selectedBorderColorIndex == index
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
                  context.read<SettingsBloc>().add(
                    OnSaveProfileEvent(
                      profileModel: ProfileModel(
                        avatar: _avatars[_selectedAvatarIndex],
                        background:
                            _profileColors[_selectedBackgroundColorIndex]
                                .toARGB32(),
                        border: _profileColors[_selectedBorderColorIndex]
                            .toARGB32(),
                      ),
                    ),
                  );
                  context.read<SettingsBloc>().add(OnGetProfileEvent());
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
