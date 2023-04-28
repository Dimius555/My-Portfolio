import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/config/localization/locale_keys.g.dart';
import 'package:portfolio/config/localization/localization_notifier.dart';
import 'package:portfolio/config/localization/localization_storage.dart';
import 'package:portfolio/config/router/routes.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/config/theme/theme_notifier.dart';
import 'package:portfolio/service_locator.dart';
import 'package:portfolio/views/widgets/custom_avatar.dart';
import 'package:portfolio/views/widgets/custom_button.dart';
import 'package:portfolio/views/widgets/language_picker.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.onScrollValue});

  final double onScrollValue;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size(double.infinity, 44);
}

class _CustomAppBarState extends State<CustomAppBar> {
  late bool isDarkMode;

  @override
  void initState() {
    isDarkMode = sl<ThemeNotifier>().isDarkMode;
    sl<ThemeNotifier>().addListener(() {
      isDarkMode = sl<ThemeNotifier>().isDarkMode;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      leadingWidth: 72,
      backgroundColor: theme.primaryAppBarColor.withAlpha(64),
      leading: Padding(
        padding: const EdgeInsets.only(top: 4.0, left: 20.0),
        child: AnimatedOpacity(
            opacity: widget.onScrollValue,
            duration: const Duration(milliseconds: 150),
            child: const CustomAvatar(
              borderWidth: 1,
              radius: 22,
            )),
      ),
      title: AnimatedOpacity(
        opacity: widget.onScrollValue,
        duration: const Duration(milliseconds: 20),
        child: SizedBox(
          width: 540,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                onPressed: () {
                  GoRouter.of(context).pushNamed(Routes.home);
                },
                title: LocaleKeys.home_title.tr(),
                type: ButtonType.text,
              ),
              CustomButton(
                onPressed: () {
                  GoRouter.of(context).pushNamed(Routes.projects);
                },
                title: LocaleKeys.projects_title.tr(),
                type: ButtonType.text,
              ),
              CustomButton(
                onPressed: () {
                  GoRouter.of(context).pushNamed(Routes.about);
                },
                title: LocaleKeys.about_title.tr(),
                type: ButtonType.text,
              ),
            ],
          ),
        ),
      ),
      actions: [
        Row(
          children: [
            LanguagePicker(
              onChanged: (v) async {
                if (v == 'Русский') {
                  await context.setLocale(const Locale('ru'));
                  sl<LocalizationNotifier>().setNewLocalization(localization: SupportedLocalizations.ru);
                } else if (v == 'English') {
                  await context.setLocale(const Locale('en'));
                  sl<LocalizationNotifier>().setNewLocalization(localization: SupportedLocalizations.en);
                }
              },
            ),
            IconButton(
              onPressed: () {
                sl<ThemeNotifier>().switchTheme();
              },
              icon: isDarkMode
                  ? const Icon(
                      Icons.nightlight_outlined,
                      color: LightModeColors.primaryBackgroundColor,
                    )
                  : const Icon(Icons.sunny, color: LightModeColors.primaryBackgroundColor),
            ),
          ],
        ),
      ],
    );
  }
}
