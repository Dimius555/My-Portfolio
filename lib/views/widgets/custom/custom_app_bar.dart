// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:portfolio/config/constants/app_constants.dart';
import 'package:portfolio/config/constants/app_icons.dart';
import 'package:portfolio/config/router/routes.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/config/theme/theme_notifier.dart';
import 'package:portfolio/config/app_setup/service_locator.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.showHomeButton = true});

  final bool showHomeButton;

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
    final size = MediaQuery.of(context).size;
    return size.width > AppConstants.mobileModeBorderWidth
        ? _WebCustomAppBar(const Key('webAppBar'), widget.showHomeButton)
        : _MobileCustomAppBar(const Key('mobileAppBar'), widget.showHomeButton);

    // AppBar(
    //   automaticallyImplyLeading: false,
    //   centerTitle: true,
    //   leadingWidth: 72,
    //   backgroundColor: theme.primaryAppBarColor.withAlpha(64),
    //   leading: Padding(
    //     padding: const EdgeInsets.only(top: 4.0, left: 20.0),
    //     child: AnimatedOpacity(
    //         opacity: widget.onScrollValue,
    //         duration: const Duration(milliseconds: 150),
    //         child: const CustomAvatar(
    //           borderWidth: 1,
    //           radius: 22,
    //         )),
    //   ),
    //   title: AnimatedOpacity(
    //     opacity: widget.onScrollValue,
    //     duration: const Duration(milliseconds: 20),
    //     child: SizedBox(
    //       width: 540,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: const [
    //           // CustomButton(
    //           //   onPressed: () {
    //           //     GoRouter.of(context).pushNamed(Routes.home);
    //           //   },
    //           //   title: LocaleKeys.home_title.tr(),
    //           //   type: ButtonType.text,
    //           // ),
    //           // CustomButton(
    //           //   onPressed: () {
    //           //     GoRouter.of(context).pushNamed(Routes.projects);
    //           //   },
    //           //   title: LocaleKeys.projects_title.tr(),
    //           //   type: ButtonType.text,
    //           // ),
    //           // CustomButton(
    //           //   onPressed: () {
    //           //     GoRouter.of(context).pushNamed(Routes.about);
    //           //   },
    //           //   title: LocaleKeys.about_title.tr(),
    //           //   type: ButtonType.text,
    //           // ),
    //         ],
    //       ),
    //     ),
    //   ),
    //   actions: [
    //     Row(
    //       children: [
    //         LanguagePicker(
    //           onChanged: (v) async {
    //             if (v == 'Русский') {
    //               await context.setLocale(const Locale('ru'));
    //               sl<LocalizationNotifier>().setNewLocalization(localization: SupportedLocalizations.ru);
    //             } else if (v == 'English') {
    //               await context.setLocale(const Locale('en'));
    //               sl<LocalizationNotifier>().setNewLocalization(localization: SupportedLocalizations.en);
    //             }
    //           },
    //         ),
    //         IconButton(
    //           onPressed: () {
    //             sl<ThemeNotifier>().switchTheme();
    //           },
    //           icon: isDarkMode
    //               ? const Icon(
    //                   Icons.nightlight_outlined,
    //                   color: LightModeColors.primaryBackgroundColor,
    //                 )
    //               : const Icon(Icons.sunny, color: LightModeColors.primaryBackgroundColor),
    //         ),
    //       ],
    //     ),
    //   ],
    // );
  }
}

class _WebCustomAppBar extends StatelessWidget {
  const _WebCustomAppBar(
    Key? key,
    this.showHomeButton,
  ) : super(key: key);

  final bool showHomeButton;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        if (showHomeButton)
          TextButton(
            onPressed: () {
              GoRouter.of(context).pushReplacementNamed(Routes.home);
            },
            style: TextButton.styleFrom(padding: const EdgeInsets.all(16.0)),
            child: Text(
              'Home',
              style: theme.buttonStyle,
            ),
          ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(padding: const EdgeInsets.all(16.0)),
          child: Text(
            'Works',
            style: theme.buttonStyle,
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(padding: const EdgeInsets.all(16.0)),
          child: Text(
            'Blog',
            style: theme.buttonStyle,
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(padding: const EdgeInsets.all(16.0)),
          child: Text(
            'Contact',
            style: theme.buttonStyle,
          ),
        )
      ],
    );
  }
}

class _MobileCustomAppBar extends StatelessWidget {
  const _MobileCustomAppBar(
    Key? key,
    this.showHomeButton,
  ) : super(key: key);

  final bool showHomeButton;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (cntxt) {
                      return Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 32),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (showHomeButton)
                                TextButton(
                                  onPressed: () {
                                    GoRouter.of(context).pushReplacementNamed(Routes.home);
                                    Navigator.pop(cntxt);
                                  },
                                  style: TextButton.styleFrom(padding: const EdgeInsets.all(16.0)),
                                  child: Text(
                                    'Home',
                                    style: theme.buttonStyle,
                                  ),
                                ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(cntxt);
                                },
                                style: TextButton.styleFrom(padding: const EdgeInsets.all(16.0)),
                                child: Text(
                                  'Works',
                                  style: theme.buttonStyle,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(cntxt);
                                },
                                style: TextButton.styleFrom(padding: const EdgeInsets.all(16.0)),
                                child: Text(
                                  'Blog',
                                  style: theme.buttonStyle,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(cntxt);
                                },
                                style: TextButton.styleFrom(padding: const EdgeInsets.all(16.0)),
                                child: Text(
                                  'Contact',
                                  style: theme.buttonStyle,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  AppIcons.menuIcon,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
