import 'package:flutter/material.dart';
import 'package:agmais_mobile/utils/extenstion_methods.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    // brightness: Brightness.light,
    primaryColor: Theme.of(context).colorScheme.green,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(primary: Theme.of(context).colorScheme.green),
    fontFamily: 'Inter',
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      toolbarHeight: 120,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontFamily: 'Inter',
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.green,
      ),
    ),
    scaffoldBackgroundColor: Theme.of(context).colorScheme.backgroundColor,
    textTheme: const TextTheme(
      /// Topo de página
      headline1: TextStyle(
        // color: Theme.of(context).colorScheme.blue,
        fontFamily: 'Inter',
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),

      /// Título de conteúdo
      headline2: TextStyle(
        // color: Theme.of(context).colorScheme.blue,
        fontFamily: 'Inter',
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),

      /// Descrição de conteúdo
      bodyText2: TextStyle(
        // color: Theme.of(context).colorScheme.grey,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),

      bodyText1: TextStyle(
        // color: Theme.of(context).colorScheme.grey,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),

      button: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),

      // /// Para textos dentro dos inputs
      // subtitle1: TextStyle(
      //   fontFamily: 'Roboto',
      //   fontWeight: FontWeight.normal,
      //   fontSize: 18,
      //   color: Theme.of(context).colorScheme.blue,
      // ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: const OutlineInputBorder(
          // borderSide: BorderSide(
          //   color: Theme.of(context).colorScheme.green,
          // ),
          ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.green,
        ),
      ),
      labelStyle: const TextStyle(
        // color: Theme.of(context).colorScheme.green,
        fontFamily: 'Inter',
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
          BorderSide(
            color: Theme.of(context).colorScheme.green,
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
      ),
    ),
  );
}
