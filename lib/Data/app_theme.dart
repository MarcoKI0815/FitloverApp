
import 'package:flutter/material.dart';

final ThemeData fitLoverTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: const Color.fromARGB(255, 10, 20, 46),
  primaryColor: const Color(0xFF00BFFF), // Hellblauer Akzent
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF00BFFF), // Hellblau
    secondary: Color(0xFF00BFFF),
    background: Color.fromARGB(255, 10, 20, 46),
    surface: Color.fromARGB(255, 20, 30, 56),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onBackground: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
    titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 20, 30, 56),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF00BFFF),
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Color.fromARGB(255, 20, 30, 56),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF00BFFF)),
    ),
    labelStyle: TextStyle(color: Colors.white70),
  ),
);