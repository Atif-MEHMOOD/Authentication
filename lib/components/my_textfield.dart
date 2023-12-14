import 'package:flutter/material.dart';

import '../Utils/Utils.dart';

import 'package:flutter/material.dart';




// class MyTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final bool obscureText;
//   final Widget? icon;  // Use 'Icon?' instead of 'InkWell? Icon'
//   final TextInputType? keyboardType;
//   final ValueChanged<String>? onSubmitted;
//   final FocusNode? focus;
//   final bool? autofocus;
//
//
//   MyTextField({
//     Key? key,
//     required this.controller,
//     required this.hintText,
//     required this.obscureText,
//     this.icon,  // Use 'icon' instead of 'Icon'
//     this.keyboardType,
//     this.onSubmitted,
//     this.focus,
//     this.autofocus,
//
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25.0),
//       child: TextField(
//         controller: controller,
//         obscureText: obscureText,
// focusNode: focus,
//         decoration: InputDecoration(
//           enabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.white),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey.shade400),
//           ),
//           fillColor: Colors.grey.shade200,
//           filled: true,
//           hintText: hintText,
//           suffixIcon: icon,  // Use 'icon' instead of 'Icon'
//           hintStyle: TextStyle(color: Colors.grey[500]),
//         ),
//         keyboardType: keyboardType,
//         autofocus: autofocus ?? false,
//         textInputAction: onSubmitted != null
//             ? TextInputAction.next
//             : TextInputAction.done,
//
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? icon;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onSubmitted;
  final FocusNode? focus;
  final bool? autofocus;
  final FormFieldValidator<String>? validator; // New property

  MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.icon,
    this.keyboardType,
    this.onSubmitted,
    this.focus,
    this.autofocus,
    this.validator, // New property
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField( // Changed from TextField to TextFormField
        controller: controller,
        obscureText: obscureText,
        focusNode: focus,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          suffixIcon: icon,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
        keyboardType: keyboardType,
        autofocus: autofocus ?? false,
        textInputAction: onSubmitted != null ? TextInputAction.next : TextInputAction.done,
        onFieldSubmitted: onSubmitted, // Added onFieldSubmitted
        validator: validator, // Added validator
      ),
    );
  }
}
