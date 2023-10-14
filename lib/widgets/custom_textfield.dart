import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool? isPassword;
  final void Function(String)? onEnter;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isPassword,
    this.onEnter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasOnEnter = onEnter != null ? true : false;
    return TextField(
      onSubmitted: hasOnEnter ? onEnter : null,
      obscureText: isPassword == true,
      enableSuggestions: isPassword != true,
      autocorrect: isPassword != true,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        filled: true,
        fillColor: const Color(0xffF5F6FA),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}