import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomTextForm({
    super.key,
    required this.labelText,
    required this.icon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
