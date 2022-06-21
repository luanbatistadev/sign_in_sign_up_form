import 'package:flutter/material.dart';

class Themes {
   final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color.fromARGB(255, 67, 90, 194),
      secondary: const Color.fromARGB(255, 67, 90, 194),
      secondaryContainer: Colors.black,
      tertiary: const Color.fromARGB(255, 175, 179, 206),
    ),
  );
}
