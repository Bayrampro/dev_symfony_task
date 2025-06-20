import 'package:flutter/material.dart';

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF7B2FF2),
    primary: const Color(0xFF7B2FF2),
    secondary: const Color(0xFFF357A8),
    surface: Colors.white,
    background: const Color(0xFFF3F3FB),
    primaryContainer: const Color(0xFF8EC5FC),
    secondaryContainer: const Color(0xFFE0C3FC),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black87,
    onBackground: Colors.black,
    brightness: Brightness.light,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF2D1457)),
    bodyLarge: TextStyle(fontSize: 18, color: Color(0xFF2D1457)),
    bodyMedium: TextStyle(fontSize: 15, color: Color(0xFF2D1457)),
    labelLarge: TextStyle(fontSize: 16, color: Color(0xFF7B2FF2)),
    labelMedium: TextStyle(fontSize: 13, color: Color(0xFF7B2FF2)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Color(0xFF7B2FF2)),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
      textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16)))),
    ),
  ),
  cardTheme: const CardThemeData(
    color: Colors.white,
    elevation: 8,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF7B2FF2),
    foregroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF7B2FF2),
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
  ),
); 