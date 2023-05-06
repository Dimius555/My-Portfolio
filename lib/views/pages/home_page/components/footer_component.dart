part of '../home_page.dart';

class _FooterComponent extends StatelessWidget {
  const _FooterComponent();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return Container(
      width: double.infinity,
      height: 82,
      decoration: BoxDecoration(color: theme.primaryBackgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _SocialMediaRow(),
        ],
      ),
    );
  }
}

class _SocialMediaRow extends StatelessWidget {
  const _SocialMediaRow();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return Row(
      children: [
        const SizedBox(width: 16),
        SvgPicture.asset(
          'assets/icons/ic_mail.svg',
          width: 32,
          height: 32,
          color: theme.primaryBackgroundInvertedColor,
        ),
        const SizedBox(width: 44),
        InkWell(
          onTap: () {
            window.open(telegramLink, "_blank");
          },
          child: SvgPicture.asset(
            'assets/icons/ic_telegram.svg',
            width: 32,
            height: 32,
            color: theme.linksColor,
          ),
        ),
        const SizedBox(width: 32),
        InkWell(
          onTap: () {
            window.open(githubLink, "_blank");
          },
          child: SvgPicture.asset(
            'assets/icons/ic_github.svg',
            width: 32,
            height: 32,
            color: theme.primaryBackgroundInvertedColor,
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
