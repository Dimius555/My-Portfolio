import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';

class TechContainerWidget extends StatelessWidget {
  const TechContainerWidget({super.key, required this.title, required this.icon, required this.description});

  final String title;
  final String description;
  final String icon;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);

    return AspectRatio(
      aspectRatio: 0.78,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor,
                blurRadius: 8.0,
              )
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(12.0),
            ),
            color: theme.primaryBackgroundColor),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(icon, width: 44, height: 44),
              const SizedBox(height: 12),
              Text(
                title,
                style: theme.header2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: theme.regular4,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
