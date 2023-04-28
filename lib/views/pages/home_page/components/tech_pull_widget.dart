import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/config/localization/locale_keys.g.dart';
import 'package:portfolio/config/localization/localization_notifier.dart';
import 'package:portfolio/config/localization/localization_storage.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:provider/provider.dart';

class TechPullWidget extends StatelessWidget {
  const TechPullWidget({super.key, required this.screenSize});

  final Size screenSize;
  final double _ruSize = 350;
  final double _enSize = 350;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final currentLocalization = context.watch<LocalizationNotifier>().currentLocalization;
    final techSize = currentLocalization == SupportedLocalizations.en ? _enSize : _ruSize;
    final isExpanded = screenSize.width > (techSize * 3 + 200);
    return Container(
      color: theme.primaryBackgroundColor,
      height: isExpanded ? 800 : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: isExpanded
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: techSize,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _TechBlockWidget(
                          title: 'Flutter',
                          icon: 'assets/icons/ic_flutter.png',
                          description: LocaleKeys.skill_flutter_description.tr(),
                        ),
                        _TechBlockWidget(
                          title: 'Swift',
                          icon: 'assets/icons/ic_swift.png',
                          description: LocaleKeys.skill_ios_description.tr(),
                        ),
                        _TechBlockWidget(
                          title: 'Firebase',
                          icon: 'assets/icons/ic_firebase.png',
                          description: LocaleKeys.skill_firebase_description.tr(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: techSize,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _TechBlockWidget(
                          title: 'Design',
                          icon: 'assets/icons/ic_figma.png',
                          description: LocaleKeys.skill_figma_description.tr(),
                        ),
                        _TechBlockWidget(
                          title: 'Git',
                          icon: 'assets/icons/ic_git.png',
                          description: LocaleKeys.skill_git_description.tr(),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  const SizedBox(height: 20),
                  _TechBlockWidget(
                    title: 'Flutter',
                    icon: 'assets/icons/ic_flutter.png',
                    description: LocaleKeys.skill_flutter_description.tr(),
                  ),
                  const SizedBox(height: 20),
                  _TechBlockWidget(
                    title: 'Swift',
                    icon: 'assets/icons/ic_swift.png',
                    description: LocaleKeys.skill_ios_description.tr(),
                  ),
                  const SizedBox(height: 20),
                  _TechBlockWidget(
                    title: 'Firebase',
                    icon: 'assets/icons/ic_firebase.png',
                    description: LocaleKeys.skill_firebase_description.tr(),
                  ),
                  const SizedBox(height: 20),
                  _TechBlockWidget(
                    title: 'Design',
                    icon: 'assets/icons/ic_figma.png',
                    description: LocaleKeys.skill_figma_description.tr(),
                  ),
                  const SizedBox(height: 20),
                  _TechBlockWidget(
                    title: 'Git',
                    icon: 'assets/icons/ic_git.png',
                    description: LocaleKeys.skill_git_description.tr(),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
      ),
    );
  }
}

class _TechBlockWidget extends StatelessWidget {
  const _TechBlockWidget({required this.title, required this.icon, required this.description});

  final String title;
  final String description;
  final String icon;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);

    return AspectRatio(
      aspectRatio: 1,
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
            color: theme.primaryCardBackgroundColor),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Image.asset(icon, width: 48, height: 48),
              const SizedBox(height: 8),
              Text(
                title,
                style: theme.header3,
                textAlign: TextAlign.center,
              ),
              Text(
                description,
                style: theme.regular3,
                textAlign: TextAlign.center,
                // overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
