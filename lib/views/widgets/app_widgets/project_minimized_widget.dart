import 'package:flutter/material.dart';
import 'package:portfolio/config/constants/assets.dart';
import 'package:portfolio/config/theme/app_theme.dart';

class ProjectMinimizedWidget extends StatelessWidget {
  const ProjectMinimizedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return Column(
      children: [
        Row(
          children: [
            Padding(padding: const EdgeInsets.only(right: 20), child: Image.asset(Assets.placeholder)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Food Mobile App',
                    style: theme.header1,
                  ),
                  Text(
                    'Application',
                    style: theme.regular1.copyWith(color: theme.textSecondaryColor),
                  ),
                  Text(
                    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
                    style: theme.regular4,
                  )
                ],
              ),
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Divider(),
        )
      ],
    );
  }
}
