part of '../skills_page.dart';

class _ExplanationComponent extends StatelessWidget {
  const _ExplanationComponent();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(color: theme.secondaryBackgroundColor),
      child: Padding(
        padding: size.width > AppConstants.mobileModeBorderWidth
            ? EdgeInsets.symmetric(horizontal: size.width * 0.16, vertical: 16.0)
            : EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              '1. Please take into consideration that everything mentioned above doesn\'t mean that I may know or don\'t know something. These scores provides you understanding of what type of work can be done and what I am interested in.',
              style: theme.regular5.copyWith(color: theme.textSecondaryColor),
            ),
            const SizedBox(height: 10),
            Text(
              '2. Skill level equal or over 90% means that I know this stuff confidentaly and can do difficult things.',
              style: theme.regular5.copyWith(color: theme.textSecondaryColor),
            ),
            const SizedBox(height: 10),
            Text(
              '3. Skill level between 70% and 90% means that I know this staff enough confidentaly and can do most of things that are not too hard.',
              style: theme.regular5.copyWith(color: theme.textSecondaryColor),
            ),
            const SizedBox(height: 10),
            Text(
              '4. Skill level between 60% and 70% means that I know this staff in middle level and can create some things that are simple to do and not hard.',
              style: theme.regular5.copyWith(color: theme.textSecondaryColor),
            ),
            const SizedBox(height: 10),
            Text(
              '5. Skill level less then 60% means that I know this staff on basic level and can do simple things.',
              style: theme.regular5.copyWith(color: theme.textSecondaryColor),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
