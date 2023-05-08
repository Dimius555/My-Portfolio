import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/config/localization/localization_notifier.dart';
import 'package:portfolio/config/router/route_config.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/config/theme/theme_notifier.dart';
import 'package:provider/provider.dart';

import 'service_locator.dart';

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale.fromSubtags(languageCode: 'ru'),
        Locale.fromSubtags(languageCode: 'en'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale.fromSubtags(languageCode: 'ru'),
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => sl<ThemeNotifier>()),
            ChangeNotifierProvider(create: (_) => sl<LocalizationNotifier>()),
          ],
          builder: (context, child) {
            final isDarkMode = context.watch<ThemeNotifier>().isDarkMode;

            return MaterialApp.router(
              title: 'Portfolio',
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              routeInformationParser: appRouter.router.routeInformationParser,
              routerDelegate: appRouter.router.routerDelegate,
              theme: AppTheme.lightTheme(),
              darkTheme: AppTheme.darkTheme(),
              themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            );
          }),
    );
  }
}
