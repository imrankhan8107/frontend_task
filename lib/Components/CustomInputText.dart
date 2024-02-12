import 'package:flutter/material.dart';

class CustomInputText extends StatelessWidget {
  const CustomInputText(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.label,
      required this.isPass});
  final String hintText;
  final TextEditingController controller;
  final String label;
  final bool isPass;
  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
      borderRadius: BorderRadius.circular(10),
    );
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextField(
        autofocus: true,
        controller: controller,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          hintText: hintText,
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          filled: true,
          contentPadding: const EdgeInsets.all(15),
        ),
        obscureText: isPass,
        // keyboardType: textInputType,
      ),
    );
  }
}
