import 'package:flutter/material.dart';
import 'package:growbase_mobile_flutter/themes/app-colors.theme-extension.dart';

const Color _primaryColor = Color(0xFF008065);

ThemeData lightTheme() {
  return ThemeData(
    primaryColor: _primaryColor,
    fontFamily: 'Inter',
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(
        color: _primaryColor,
      ),
    ),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    dialogBackgroundColor: Colors.white,
    cardColor: Colors.white, // Containers and Cards background
    canvasColor: const Color(0xFFF5F5F5), // Dropdown background
    textTheme: const TextTheme(
      /// Topo de página
      displayLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),

      /// Título de conteúdo
      displayMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.black,
      ),

      /// Descrição de conteúdo
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18,
        color: Colors.black,
      ),

      bodyLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Colors.black,
      ),

      labelLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),

      // /// Para textos dentro dos inputs
      titleMedium: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 18,
        color: Colors.black,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          // borderSide: BorderSide(
          //   color: _primaryColor,
          // ),
          ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: _primaryColor,
        ),
      ),
      labelStyle: TextStyle(
        // color: _primaryColor,

        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            color: _primaryColor,
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
      ),
    ),
    extensions: [
      AppColors(
        primary: _primaryColor,
        red: const Color(0xFFBD0A0A),
        yellow: const Color(0xFFCFB848),
        blue: const Color(0xFF0963BD),
        grey: const Color(0XFF9EA1A3),
        lightGrey: const Color(0XFFE8E8E8),
        darkGrey: Colors.black.withOpacity(0.25),
        backgroundColor: const Color(0xFFF5F5F5),
        colorCard: const Color(0XFFFFFFFF),
      ),
    ],
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          brightness: Brightness.light,
          primary: _primaryColor,
        )
        .copyWith(background: const Color(0xFFF5F5F5)),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    primaryColor: _primaryColor,
    fontFamily: 'Inter',
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0XFF2D2825),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(
        color: _primaryColor,
      ),
    ),
    scaffoldBackgroundColor: const Color(0XFF2D2825),
    dialogBackgroundColor: const Color(0XFF463E3A),
    cardColor: const Color(0XFF463E3A), // Containers and Cards background
    canvasColor: const Color(0XFF2D2825), // Dropdown background
    textTheme: const TextTheme(
      /// Topo de página
      displayLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),

      /// Título de conteúdo
      displayMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.white,
      ),

      /// Descrição de conteúdo
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18,
        color: Colors.white,
      ),

      bodyLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Colors.white,
      ),

      labelLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.white,
      ),

      // /// Para textos dentro dos inputs
      titleMedium: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 18,
        color: Colors.white,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          // borderSide: BorderSide(
          //   color: _primaryColor,
          // ),
          ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: _primaryColor,
        ),
      ),
      labelStyle: TextStyle(
        // color: _primaryColor,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            color: _primaryColor,
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
      ),
    ),
    extensions: [
      AppColors(
        primary: _primaryColor,
        red: const Color(0XFFFF6E6E),
        yellow: const Color(0xFFCFB848),
        blue: const Color(0XFF6EB6FF),
        grey: const Color(0XFF9EA1A3),
        lightGrey: const Color(0XFFE8E8E8),
        darkGrey: Colors.black.withOpacity(0.25),
        backgroundColor: const Color(0XFF2D2825),
        colorCard: const Color(0XFF463E3A),
      ),
    ],
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          brightness: Brightness.dark,
          primary: _primaryColor,
        )
        .copyWith(background: const Color(0XFF2D2825)),
  );
}
