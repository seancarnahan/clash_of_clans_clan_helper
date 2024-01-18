import 'package:flutter/material.dart';

ThemeData buildClashOfClansTheme() {
  return ThemeData(
    // Primary color for the app
    primaryColor: Colors.deepOrange,

    // Scaffold background color
    scaffoldBackgroundColor: const Color(0xFF1E1E1E),

    fontFamily: 'CustomClashOfClans',

    // App bar theme
    appBarTheme: AppBarTheme(
      color: Colors.brown[800], toolbarTextStyle: const TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      ).bodyMedium, titleTextStyle: const TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      ).titleLarge,
    ),

    // Text theme
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
    ),

    // Button theme
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.deepOrange,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),

    // Elevated Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepOrangeAccent,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        textStyle: const TextStyle(fontSize: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),

    // Icon theme
    iconTheme: const IconThemeData(
      color: Colors.amber,
    ),

    // Card theme
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      shadowColor: Colors.blueGrey.withOpacity(0.5)
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
    ),
    
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
  );
}
