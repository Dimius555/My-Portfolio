import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/views/widgets/on_hover_wrapper.dart';

class AdminMenuWidget extends StatelessWidget {
  const AdminMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return Container(
      margin: const EdgeInsets.all(20),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: theme.secondaryBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: theme.shadowColor,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 64,
            color: theme.linksColor,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Menu',
                style: theme.header2.copyWith(color: theme.primaryBackgroundColor),
              ),
            ),
          ),
          const SizedBox(height: 44),
          OnHoverWrapper(builder: (isHovered) {
            return TextButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 10),
                child: Text(
                  'Home',
                  style: theme.regular1.copyWith(decoration: isHovered ? TextDecoration.underline : null),
                ),
              ),
            );
          }),
          const SizedBox(height: 32),
          OnHoverWrapper(builder: (isHovered) {
            return TextButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 10),
                child: Text(
                  'Skills',
                  style: theme.regular1.copyWith(decoration: isHovered ? TextDecoration.underline : null),
                ),
              ),
            );
          }),
          const SizedBox(height: 32),
          OnHoverWrapper(builder: (isHovered) {
            return TextButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 10),
                child: Text(
                  'Works',
                  style: theme.regular1.copyWith(decoration: isHovered ? TextDecoration.underline : null),
                ),
              ),
            );
          }),
          const SizedBox(height: 32),
          OnHoverWrapper(builder: (isHovered) {
            return TextButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 10),
                child: Text(
                  'Blog',
                  style: theme.regular1.copyWith(decoration: isHovered ? TextDecoration.underline : null),
                ),
              ),
            );
          }),
          const SizedBox(height: 32),
          OnHoverWrapper(builder: (isHovered) {
            return TextButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 10),
                child: Text(
                  'Contacts',
                  style: theme.regular1.copyWith(decoration: isHovered ? TextDecoration.underline : null),
                ),
              ),
            );
          }),
          const SizedBox(height: 128),
        ],
      ),
    );
  }
}
