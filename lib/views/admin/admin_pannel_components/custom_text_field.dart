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
    this.maxLines = 1,
  });

  final String label;
  final String? errorMessage;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final bool isSecured;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return Material(
      color: theme.primaryBackgroundColor,
      child: TextField(
        maxLines: maxLines,
        cursorColor: theme.textPrimaryColor,
        controller: controller,
        onChanged: onChanged,
        obscureText: isSecured,
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(color: theme.appSecondaryColor),
          labelText: label,
          errorText: errorMessage,
        ),
      ),
    );
  }
}
