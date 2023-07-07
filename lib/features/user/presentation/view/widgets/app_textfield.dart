import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hintText;
  final String? Function(String?)? validator;
  const AppTextField({
    required this.controller,
    this.label,
    this.hintText,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        labelText: label,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      ),
      validator: validator,
    );
  }
}
