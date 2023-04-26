import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'app_colors.dart';

class AppTheme {
  AppTheme({this.brightness = Brightness.light});

  final Brightness brightness;

  static ThemeData lightTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: "SF Pro Display",
        scaffoldBackgroundColor: LightModeColors.primaryBackgroundColor,
        dividerColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light, statusBarBrightness: Brightness.dark),
          centerTitle: true,
          backgroundColor: LightModeColors.primaryAppBarColor,
          elevation: 0,
          shadowColor: Color.fromRGBO(0, 0, 0, 0.1),
        ),
        colorScheme: const ColorScheme.light(
          onSecondary: Colors.white,
        ),
        textTheme: const TextTheme(),
      );

  static ThemeData darkTheme() => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: DarkModeColors.primaryBackgroundColor,
        dividerColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light, statusBarBrightness: Brightness.dark),
          centerTitle: true,
          backgroundColor: DarkModeColors.primaryAppBarColor,
          elevation: 0,
          shadowColor: Color.fromRGBO(0, 0, 0, 0.1),
        ),
      );

  static AppTheme read(BuildContext context) {
    return AppTheme(brightness: Theme.of(context).brightness);
  }

  bool get isDarkTheme => brightness == Brightness.dark;

  TextStyle get header0 => TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get header1 => TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get header2 => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get header3 => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get regular0 => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get regular1 => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get regular2 => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get regular3 => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get button0 => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get button1 => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );
}
