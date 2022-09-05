// import 'package:flutter/material.dart';

// class Btn extends StatelessWidget {
//   // final onTap;
//   final Color textColor;
//   final backgroundColor;
//   final borderColor;
//   final String text;
//   final IconData icon;
//   final _formKey = GlobalKey<FormState>();
//   double size;

//   Btn(
//       {super.key,
//       // this.onTap,
//       required this.textColor,
//       required this.backgroundColor,
//       required this.borderColor,
//       required this.text,
//       required this.size,
//       required this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         if (_formKey.currentState!.validate()) {
//           print('Hello');
//         }
//       },
//       child: Container(
//         width: 180,
//         height: 40,
//         child: Center(
//           child: Text(
//             text,
//             style: TextStyle(
//               color: textColor,
//             ),
//           ),
//         ),
//         decoration: BoxDecoration(
//           color: backgroundColor,
//           borderRadius: BorderRadius.circular(50),
//           border: Border.all(
//             color: borderColor,
//             width: 1.0,
//           ),
//         ),
//       ),
//     );
//   }
// }
