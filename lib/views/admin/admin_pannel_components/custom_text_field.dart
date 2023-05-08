import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.errorMessage,
    this.onChanged,
    this.isSecured = false,
  });

  final String label;
  final String? errorMessage;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final bool isSecured;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return TextField(
      cursorColor: theme.textPrimaryColor,
      controller: controller,
      onChanged: onChanged,
      obscureText: isSecured,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: theme.appSecondaryColor),
        labelText: label,
        errorText: errorMessage,
      ),
    );
  }
}
