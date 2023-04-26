import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    super.key,
    this.radius = 144,
  });

  final double radius;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return Material(
      elevation: 12,
      shadowColor: theme.shadowColor,
      borderRadius: const BorderRadius.all(Radius.circular(148)),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: LightModeColors.primaryBackgroundColor,
              width: 4,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(148),
            ),
          ),
          child: CircleAvatar(
              radius: radius,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(theme.primaryBackgroundColor.withOpacity(0.3), BlendMode.color),
                    child: Image.asset(
                      'assets/images/my_picture.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ))),
    );
  }
}
