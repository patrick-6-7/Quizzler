// import 'package:flutter/material.dart';

// class RadioButton extends StatelessWidget {
//   final bool answer;
//   const RadioButton({
//     super.key,
//     required this.answer
//     });

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListTile(
//         title: const Text('False'),
//         leading: Radio<bool>(
//           value: false,
//           groupValue: _answer,
//           onChanged: (bool? value) {
//             setState(() {
//               _answer = value;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }