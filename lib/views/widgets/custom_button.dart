import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';

enum ButtonType { primary, text }

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.title, this.type = ButtonType.primary});

  final Function onPressed;
  final String title;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    switch (type) {
      case ButtonType.primary:
        return ElevatedButton(
            onPressed: () {
              onPressed.call();
            },
            child: Text(
              title,
              style: theme.button0,
            ));
      case ButtonType.text:
        return TextButton(
            onPressed: () {
              onPressed.call();
            },
            child: Text(
              title,
              style: theme.button0.copyWith(color: LightModeColors.primaryBackgroundColor),
            ));
    }
  }
}
