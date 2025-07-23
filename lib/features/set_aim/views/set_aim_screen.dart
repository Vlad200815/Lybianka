import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:lybianka/features/add_money/add_money.dart';
import 'package:lybianka/features/set_aim/image_helper/image_helper.dart';
import 'package:lybianka/features/widgets/gradient_button.dart';

class SetAimScreen extends StatefulWidget {
  const SetAimScreen({super.key});

  @override
  State<SetAimScreen> createState() => _SetAimScreenState();
}

final imageHelper = ImageHelper();

class _SetAimScreenState extends State<SetAimScreen> {
  File? _image;

  final _formKey2 = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

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
                "Постав свою ціль",
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width / 8),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    final file = await imageHelper.pickImage();
                    if (file != null) {
                      final croppedFile = await imageHelper.crop(
                        file: file,
                        cropStyle: CropStyle.circle,
                      );
                      if (croppedFile != null) {
                        setState(() {
                          _image = File(croppedFile.path);
                        });
                      }
                    }
                  },
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 154, 223, 255),
                      radius: 64,
                      foregroundImage: _image != null
                          ? FileImage(_image!)
                          : null,
                      child: Icon(Icons.add_a_photo_outlined, size: 66),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 28),
              Form(
                key: _formKey2,
                child: Column(
                  children: [
                    MyTextField(
                      controller: _nameController,
                      icon: Icon(Icons.card_giftcard_rounded),
                      hint: "Що хочеш придбати",
                      fillColor: theme.colorScheme.onPrimary,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Впиши щось";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 5),
                    MyTextField(
                      controller: _priceController,
                      icon: Icon(Icons.attach_money_rounded),
                      hint: "Ціна",
                      fillColor: theme.colorScheme.onPrimary,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Впиши гроші";
                        }
                        final num? parsed = num.tryParse(value);
                        if (parsed == null || parsed <= 0) {
                          return "Некоректная сума";
                        }
                        return null; // valid
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 6),
              GradientButton(
                onPressed: () {
                  if (_formKey2.currentState!.validate()) {
                    if (_image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: theme.colorScheme.onPrimary,
                          content: Text(
                            "Будь ласка, виберіть фото",
                            style: TextStyle(
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: theme.colorScheme.onPrimary,
                        content: Text(
                          "Будь ласка, заповніть всі поля",
                          style: TextStyle(color: theme.colorScheme.onSurface),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
