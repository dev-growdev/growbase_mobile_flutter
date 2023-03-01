import 'package:flutter/material.dart';

import 'app-colors.theme-extension.dart';

const Color _primaryColor = Color(0xFF004C97);

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: _primaryColor,
    fontFamily: 'Inter',
    // scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    // dialogBackgroundColor: Colors.white,
    // cardColor: Colors.white, // Containers and Cards background
    // canvasColor: const Color(0xFFF5F5F5), // Dropdown background
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    ),
    extensions: const [
      AppColors(
        primary: _primaryColor,
        red: Color(0xFFAE0C21),
        white: Color(0xFFF2F2F2),
        lightBlue: Color(0xFF57A3ED),
        darkBlue: Color(0xFF001238),
        grey: Color(0XFF8B8986),
        lightGrey: Color(0XFFD7D4D0),
        darkGrey: Color(0xFF756F6F),
        backgroundColor: Color(0xFFF5F5F5),
        colorCard: Color(0XFFFFFFFF),
      ),
    ],
  );
}

ThemeData darkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: _primaryColor,
    fontFamily: 'Inter',
    // scaffoldBackgroundColor: const Color(0XFF2D2825),
    // dialogBackgroundColor: const Color(0XFF463E3A),
    // cardColor: const Color(0XFF463E3A), // Containers and Cards background
    // canvasColor: const Color(0XFF2D2825), // Dropdown background
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    ),
    extensions: const [
      AppColors(
        primary: _primaryColor,
        red: Color(0xFFAE0C21),
        white: Color(0xFFF2F2F2),
        lightBlue: Color(0xFF57A3ED),
        darkBlue: Color(0xFF001238),
        grey: Color(0XFF8B8986),
        lightGrey: Color(0XFFD7D4D0),
        darkGrey: Color(0xFF756F6F),
        backgroundColor: Color(0XFF2D2825),
        colorCard: Color(0XFF463E3A),
      ),
    ],
  );
}
