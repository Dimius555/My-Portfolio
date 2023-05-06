import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';

class PostMinimizedWidget extends StatelessWidget {
  const PostMinimizedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.3,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: theme.secondaryBackgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Making a design system from scratch',
            style: theme.header2,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Design, Pattern', style: theme.regular3.copyWith(color: theme.textSecondaryColor)),
              Text('|', style: theme.regular3),
              Text('12 Feb 2020', style: theme.regular3.copyWith(color: theme.textSecondaryColor)),
            ],
          ),
          Text(
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
            style: theme.regular4,
          )
        ],
      ),
    );
  }
}
