import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // *****************
  // static colors
  // *****************
  static const Color skeletonBaseColor = Color(0xFFDEDFE0);
  static const Color _lightPrimaryColor = Colors.white;
  static const Color _lightPrimaryVariantColor = Colors.black;
  static const Color _lightOnPrimaryColor = Colors.black;
  static const Color _lightTextColorPrimary = Colors.black;
  static const Color _appbarColorLight = Colors.black;
  static const Color composerBackground = Color(0xFF4D505E);
  static const Color composerGray = Color(0xFFA1A4AD);
  static const Color composerHeader = Color(0xFF4C546C);
  static const Color chatBackground = Color(0xFF3A3A4A);
  static const Color grayIcon = Color(0xFF8C8C8C);
  static const Color blackText = Color(0xFF222222);
  static const Color green = Color(0xFF39A281);

  static const Color _iconColor = Colors.black;

  // *****************
  // Text Style - light
  // *****************
  static const TextStyle _lightHeadingText = TextStyle(
      color: _lightTextColorPrimary, fontSize: 20, fontWeight: FontWeight.bold);

  static const TextStyle _lightBodyText = TextStyle(
      color: _lightTextColorPrimary,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      fontSize: 16);

  static const TextTheme _lightTextTheme = TextTheme(
    headline1: _lightHeadingText,
    bodyText1: _lightBodyText,
  );

  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: _lightPrimaryColor,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: _iconColor), elevation: 0.3),
      bottomAppBarColor: _appbarColorLight,
      colorScheme: const ColorScheme.light(
        primary: _lightPrimaryColor,
        onPrimary: _lightOnPrimaryColor,
        primaryContainer: _lightPrimaryVariantColor,
      ),
      textTheme: _lightTextTheme);
}
