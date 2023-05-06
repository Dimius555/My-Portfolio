import 'package:flutter/material.dart';
import 'package:portfolio/config/constants/app_constants.dart';
import 'package:portfolio/config/constants/assets.dart';
import 'package:portfolio/config/theme/app_theme.dart';

class ProjectMinimizedWidget extends StatelessWidget {
  const ProjectMinimizedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        size.width > AppConstants.mobileModeBorderWidth ? _webOrientation(theme, size) : _mobileOrientation(theme, size),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Divider(),
        )
      ],
    );
  }

  Widget _webOrientation(AppTheme theme, Size size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.only(right: 20), child: Image.asset(Assets.placeholder)),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Food Mobile App',
                style: theme.header1,
              ),
              const SizedBox(height: 4),
              Text(
                'Application',
                style: theme.regular2.copyWith(color: theme.textSecondaryColor),
              ),
              const SizedBox(height: 16),
              Text(
                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
                style: theme.regular4,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _mobileOrientation(AppTheme theme, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          Assets.placeholder,
          width: size.width,
          fit: BoxFit.fill,
        ),
        const SizedBox(height: 12),
        Text(
          'Food Mobile App',
          style: theme.header1,
        ),
        const SizedBox(height: 4),
        Text(
          'Application',
          style: theme.regular4.copyWith(color: theme.textSecondaryColor),
        ),
        const SizedBox(height: 16),
        Text(
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
          style: theme.regular4,
        )
      ],
    );
  }
}
