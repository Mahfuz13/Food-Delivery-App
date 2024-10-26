import 'package:flutter/material.dart';
import 'package:app/theme/style.dart';

class FormContainerWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword; // Added isPassword parameter

  const FormContainerWidget({
    Key? key,
    required this.hintText,
    this.controller,
    this.isPassword = false, // Default value for isPassword is false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: lightGreyColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword, // Use isPassword to obscure text if true
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
