part of 'app_theme.dart';

class LightModeComponents {
  static ElevatedButtonThemeData evelvatedButtonTheme() => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: LightModeColors.appPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            )),
      );

  static TextButtonThemeData textButtonThemeData() => TextButtonThemeData(
          style: TextButton.styleFrom(
        foregroundColor: LightModeColors.appSecondaryColor,
        padding: const EdgeInsets.all(16.0),
      ));

  static AppBarTheme appBarTheme() => const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      centerTitle: true,
      backgroundColor: LightModeColors.primaryBackgroundColor,
      elevation: 0,
      surfaceTintColor: Colors.transparent);
}

class DarkModeComponents {
  static ElevatedButtonThemeData evelvatedButtonTheme() => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: LightModeColors.appPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            )),
      );

  static TextButtonThemeData textButtonThemeData() => TextButtonThemeData(
          style: TextButton.styleFrom(
        foregroundColor: LightModeColors.appSecondaryColor,
        padding: const EdgeInsets.all(16.0),
      ));

  static AppBarTheme appBarTheme() => const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      centerTitle: true,
      backgroundColor: LightModeColors.primaryBackgroundColor,
      elevation: 0,
      surfaceTintColor: Colors.transparent);
}
