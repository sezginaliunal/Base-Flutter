import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    required this.controller,
    required this.labelText,
    required this.autofillHints,
    super.key,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon, // Sol ikon
    this.suffixIcon, // Sağ ikon
  });

  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Iterable<String>? autofillHints;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: autofillHints,
      controller: controller,
      decoration: InputDecoration(
        hintText: labelText,
        prefixIcon: prefixIcon, // Sol ikon
        suffixIcon: suffixIcon, // Sağ ikon
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
