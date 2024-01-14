import 'package:flutter/material.dart';

ThemeData buildClashOfClansTheme() {
  return ThemeData(
    // Primary color for the app
    primaryColor: Colors.deepOrange,

    // Scaffold background color
    scaffoldBackgroundColor: const Color(0xFF1E1E1E),

    // App bar theme
    appBarTheme: AppBarTheme(
      color: Colors.brown[800], toolbarTextStyle: const TextTheme(
        headline6: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      ).bodyText2, titleTextStyle: const TextTheme(
        headline6: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      ).headline6,
    ),

    // Text theme
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white70),
    ),

    // Button theme
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.deepOrange,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),

    // Icon theme
    iconTheme: const IconThemeData(
      color: Colors.amber,
    ),

    // Card theme
    cardTheme: CardTheme(
      color: Colors.grey[850],
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),

    // Input decoration theme (for TextFields)
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.amber),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.amber),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
      labelStyle: const TextStyle(color: Colors.white),
      hintStyle: const TextStyle(color: Colors.white70),
    ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
  );
}
