import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/config/localization/localization_notifier.dart';
import 'package:portfolio/config/localization/localization_storage.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/config/theme/theme_notifier.dart';
import 'package:portfolio/service_locator.dart';
import 'package:portfolio/views/widgets/custom_avatar.dart';
import 'package:portfolio/views/widgets/language_picker.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.avatarOpacity});

  final double avatarOpacity;

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
            opacity: widget.avatarOpacity,
            duration: const Duration(milliseconds: 150),
            child: const CustomAvatar(
              borderWidth: 1,
              radius: 22,
            )),
      ),
      // title: SizedBox(
      //   width: 330,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       TextButton(
      //         onPressed: () {
      //           GoRouter.of(context).pushNamed(Routes.home);
      //         },
      //         child: Text(LocaleKeys.home_title.tr()),
      //       ),
      //       TextButton(
      //         onPressed: () {
      //           GoRouter.of(context).pushNamed(Routes.projects);
      //         },
      //         child: Text(LocaleKeys.projects_title.tr()),
      //       ),
      //       TextButton(
      //         onPressed: () {
      //           GoRouter.of(context).pushNamed(Routes.about);
      //         },
      //         child: Text(LocaleKeys.about_title.tr()),
      //       ),
      //     ],
      //   ),
      // ),
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
              icon: isDarkMode ? const Icon(Icons.nightlight_outlined) : const Icon(Icons.sunny),
            ),
          ],
        ),
      ],
    );
  }
}
