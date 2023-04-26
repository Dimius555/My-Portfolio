import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/config/router/route_config.dart';
import 'package:portfolio/config/theme/theme_notifier.dart';
import 'package:portfolio/service_locator.dart';
import 'package:provider/provider.dart';

import 'config/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl.allReady();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => sl<ThemeNotifier>()),
        ],
        builder: (context, child) {
          final isDarkMode = context.watch<ThemeNotifier>().isDarkMode;
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routeInformationParser: appRouter.router.routeInformationParser,
            routerDelegate: appRouter.router.routerDelegate,
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          );
        });
  }
}
