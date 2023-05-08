import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';

enum ButtonType { primary, text }

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.title, this.customColor, this.horizontalPaddings = 20});

  final Function onPressed;
  final String title;
  final Color? customColor;
  final double horizontalPaddings;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: horizontalPaddings),
            backgroundColor: customColor ?? LightModeColors.appPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
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
