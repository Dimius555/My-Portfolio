import 'dart:html';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/config/constants/links.dart';
import 'package:portfolio/config/localization/locale_keys.g.dart';
import 'package:portfolio/config/theme/app_theme.dart';

class CustomFooterBar extends StatelessWidget {
  const CustomFooterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return Container(
      width: double.infinity,
      height: 82,
      decoration: BoxDecoration(color: theme.footerBackgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _Address(),
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
        const SizedBox(width: 16),
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
        const SizedBox(width: 8),
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

class _Address extends StatelessWidget {
  const _Address();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${LocaleKeys.address_country.tr()}, ${LocaleKeys.address_city.tr()}',
            style: theme.regular3,
          ),
          Text(
            '${LocaleKeys.address_street.tr()} ${LocaleKeys.address_building.tr()}',
            style: theme.regular3,
          ),
        ],
      ),
    );
  }
}
