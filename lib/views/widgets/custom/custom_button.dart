import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';

enum ButtonType { primary, text }

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.title});

  final Function onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            backgroundColor: LightModeColors.appPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            )),
        onPressed: () {
          onPressed.call();
        },
        child: Text(
          title,
          style: theme.buttonStyle.copyWith(color: LightModeColors.footerBackgroundColor),
        ));
  }
}
