import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'app_colors.dart';
part 'components_themes.dart';

class AppTheme {
  AppTheme({this.brightness = Brightness.light});

  final Brightness brightness;

  static ThemeData lightTheme() => ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: "Heebo",
      scaffoldBackgroundColor: LightModeColors.primaryBackgroundColor,
      dividerColor: LightModeColors.divierColor,
      elevatedButtonTheme: LightModeComponents.evelvatedButtonTheme(),
      textButtonTheme: LightModeComponents.textButtonThemeData(),
      appBarTheme: LightModeComponents.appBarTheme(),
      sliderTheme: LightModeComponents.sliderThemeData(),
      inputDecorationTheme: LightModeComponents.textFieldTheme());

  static ThemeData darkTheme() => ThemeData(
      brightness: Brightness.dark,
      fontFamily: "Heebo",
      useMaterial3: true,
      scaffoldBackgroundColor: DarkModeColors.primaryBackgroundColor,
      dividerColor: LightModeColors.divierColor,
      elevatedButtonTheme: DarkModeComponents.evelvatedButtonTheme(),
      textButtonTheme: DarkModeComponents.textButtonThemeData(),
      appBarTheme: DarkModeComponents.appBarTheme(),
      sliderTheme: DarkModeComponents.sliderThemeData(),
      inputDecorationTheme: LightModeComponents.textFieldTheme());

  static AppTheme read(BuildContext context) {
    return AppTheme(brightness: Theme.of(context).brightness);
  }

  bool get isDarkTheme => brightness == Brightness.dark;

  Color get primaryBackgroundColor => isDarkTheme ? DarkModeColors.primaryBackgroundColor : LightModeColors.primaryBackgroundColor;
  Color get secondaryBackgroundColor => isDarkTheme ? DarkModeColors.secondaryBackgroundColor : LightModeColors.secondaryBackgroundColor;
  Color get primaryBackgroundInvertedColor => isDarkTheme ? LightModeColors.primaryBackgroundColor : DarkModeColors.primaryBackgroundColor;
  Color get primaryAppBarColor => isDarkTheme ? DarkModeColors.primaryAppBarColor : LightModeColors.primaryAppBarColor;
  Color get primaryCardBackgroundColor => isDarkTheme ? DarkModeColors.primaryCardBackgroundColor : LightModeColors.primaryCardBackgroundColor;

  Color get footerBackgroundColor => isDarkTheme ? DarkModeColors.footerBackgroundColor : LightModeColors.footerBackgroundColor;

  Color get shadowColor => isDarkTheme ? DarkModeColors.shadowColor : LightModeColors.shadowColor;

  Color get appPrimaryColor => isDarkTheme ? DarkModeColors.appPrimaryColor : LightModeColors.appPrimaryColor;
  Color get appSecondaryColor => isDarkTheme ? DarkModeColors.appSecondaryColor : LightModeColors.appSecondaryColor;

  Color get accentPositiveColor => isDarkTheme ? DarkModeColors.accentPositiveColor : LightModeColors.accentPositiveColor;
  Color get accentWarningColor => isDarkTheme ? DarkModeColors.accentWarningColor : LightModeColors.accentWarningColor;
  Color get accentNegativeColor => isDarkTheme ? DarkModeColors.accentNegativeColor : LightModeColors.accentNegativeColor;

  Color get textPrimaryColor => isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor;
  Color get textPrimaryInvertedColor => isDarkTheme ? LightModeColors.textPrimaryColor : DarkModeColors.textPrimaryColor;
  Color get textSecondaryColor => isDarkTheme ? DarkModeColors.textSecondaryColor : LightModeColors.textSecondaryColor;
  Color get linksColor => isDarkTheme ? DarkModeColors.textLinkColor : LightModeColors.textLinkColor;

  TextStyle get header0 => TextStyle(
        fontSize: 44,
        fontFamily: 'Heebo',
        fontWeight: FontWeight.bold,
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get header1 => TextStyle(
        fontSize: 30,
        fontFamily: 'Heebo',
        fontWeight: FontWeight.bold,
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get header2 => TextStyle(
        fontSize: 26,
        fontFamily: 'Heebo',
        fontWeight: FontWeight.bold,
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get header3 => TextStyle(
        fontSize: 22,
        fontFamily: 'Heebo',
        fontWeight: FontWeight.bold,
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get regular0 => TextStyle(
        fontSize: 24,
        fontFamily: 'Heebo',
        fontWeight: FontWeight.w500,
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get regular1 => TextStyle(
        fontSize: 22,
        fontFamily: 'Heebo',
        fontWeight: FontWeight.w400,
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get regular2 => TextStyle(
        fontSize: 20,
        fontFamily: 'Heebo',
        fontWeight: FontWeight.w400,
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get regular3 => TextStyle(
        fontSize: 18,
        fontFamily: 'Heebo',
        fontWeight: FontWeight.w400,
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get regular4 => TextStyle(
        fontSize: 16,
        fontFamily: 'Heebo',
        fontWeight: FontWeight.w400,
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get regular5 => TextStyle(
        fontSize: 12,
        fontFamily: 'Heebo',
        fontWeight: FontWeight.w300,
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get buttonStyle => TextStyle(
        fontSize: 20,
        fontFamily: 'Heebo',
        fontWeight: FontWeight.w500,
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );
}
