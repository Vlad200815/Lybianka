// import 'dart:developer';
// import 'dart:math';
// import 'dart:ui';

// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:lybianka/features/add_money/add_money.dart';

// class CoolScreen extends StatefulWidget {
//   const CoolScreen({super.key});

//   @override
//   State<CoolScreen> createState() => _CoolScreenState();
// }

// class _CoolScreenState extends State<CoolScreen> {
//   bool isWriteName = false;
//   bool isStartingMoney = false;
//   bool isNextTile = false;

//   final _formKey = GlobalKey<FormState>();
//   final _formKey2 = GlobalKey<FormState>();

//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _moneyController = TextEditingController();

//   void saveInfo() {
//     if (_formKey.currentState!.validate()) {
//       if (_nameController.text.isEmpty) {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text("Напиши своє ім'я")));
//         return;
//       }
//       setState(() {
//         isNextTile = true;
//       });
//     }
//   }

//   // Form(
//   //                               key: _formKey2,
//   //                               child: MyTextField(
//   //                                 validator: (value) {
//   //                                   if (value == null || value.isEmpty) {
//   //                                     return "Write down your name";
//   //                                   }
//   //                                   return null;
//   //                                 },
//   //                                 style: TextStyle(color: Colors.black),
//   //                                 controller: _nameController,
//   //                                 icon: Icon(Icons.face, color: Colors.grey),
//   //                                 hint: "write down your name",
//   //                                 fillColor: Colors.white,
//   //                               ),
//   //                             ),

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           final size = Size(constraints.maxWidth, constraints.maxHeight);
//           return Stack(
//             children: [
//               Positioned.fill(
//                 child: ImageFiltered(
//                   imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
//                   child: CustomPaint(size: size, painter: DiagonalPainter()),
//                 ),
//               ),
//               Center(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Transform.rotate(
//                       angle: pi / 8,
//                       child: Image.asset(
//                         "assets/intro_icons/angel_ninji_2.png",
//                         scale: 4,
//                       ),
//                     ),
//                     Transform.rotate(
//                       angle: pi / 4,
//                       child: Image.asset(
//                         "assets/intro_icons/vs_image.png",
//                         scale: 6,
//                       ),
//                     ),
//                     Transform.rotate(
//                       angle: pi / 8,
//                       child: Image.asset(
//                         "assets/intro_icons/demon_ninji.png",
//                         scale: 4,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// class DiagonalPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paintWhite = Paint()
//       ..color = const Color.fromARGB(255, 139, 218, 255);
//     ;
//     final paintRed = Paint()..color = Colors.red;

//     // Draw from top-left to bottom-right
//     // canvas.drawLine(Offset(0, 0), Offset(size.width, size.height), paint);

//     // Optional: Draw from top-right to bottom-left
//     // canvas.drawLine(Offset(size.width, 0), Offset(0, size.height), paint);

//     // White triangle (top-left half)
//     final pathWhite = Path()
//       ..moveTo(0, 0)
//       ..lineTo(size.width, 0)
//       ..lineTo(0, size.height)
//       ..close();

//     // Red triangle (bottom-right half)
//     final pathRed = Path()
//       ..moveTo(size.width, size.height)
//       ..lineTo(size.width, 0)
//       ..lineTo(0, size.height)
//       ..close();

//     canvas.drawPath(pathWhite, paintWhite);
//     canvas.drawPath(pathRed, paintRed);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
