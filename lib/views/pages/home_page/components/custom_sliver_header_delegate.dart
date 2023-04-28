import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/config/localization/locale_keys.g.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/views/widgets/custom_app_bar.dart';
import 'package:portfolio/views/widgets/custom_avatar.dart';

class CustomSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  const CustomSliverHeaderDelegate();

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;
    final theme = AppTheme.read(context);

    return Stack(alignment: Alignment.center, children: [
      Material(
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: progress,
              child: ColoredBox(
                color: theme.primaryAppBarColor,
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: 1 - progress,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 97, 141, 237),
                      Color.fromARGB(255, 7, 22, 53),
                    ],
                  ),
                ),
              ),
            ),
            CustomAppBar(
              onScrollValue: progress,
            ),
          ],
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 1),
            opacity: 1 - progress,
            child: CustomAvatar(
              radius: 144 * (1 - progress),
            ),
          ),
          AnimatedOpacity(
            opacity: 1 - progress,
            duration: const Duration(milliseconds: 1),
            child: DefaultTextStyle(
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 44.0 * (1 - progress),
                fontFamily: 'ChakraPetch',
                fontWeight: FontWeight.w500,
                color: LightModeColors.primaryBackgroundColor,
              ),
              child: Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      LocaleKeys.main_flutter_developer.tr(),
                      speed: const Duration(milliseconds: 50),
                    ),
                    TypewriterAnimatedText(
                      LocaleKeys.main_ios_developer.tr(),
                      speed: const Duration(milliseconds: 50),
                    ),
                    TypewriterAnimatedText(
                      LocaleKeys.main_designer_developer.tr(),
                      speed: const Duration(milliseconds: 50),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ]);
  }

  @override
  double get maxExtent => 720;

  @override
  double get minExtent => 64;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
