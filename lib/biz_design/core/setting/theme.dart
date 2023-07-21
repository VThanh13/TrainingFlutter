import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        color: Color(0xff060606),
      ),
      titleMedium: TextStyle(
        color: Color(0xff060606),
      ),
    ),
    dialogBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Color(0xff212862),
      ),
    ),
    buttonTheme: const ButtonThemeData(buttonColor: Colors.lightBlue),
    dividerColor: const Color(0xff000000),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
    textTheme: const TextTheme(
      titleSmall: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.amber),
    ),
    dialogBackgroundColor: Colors.white,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.amber,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black87,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.amber),
      ),
    ),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Colors.white),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.all(Colors.white),
      ),
    ),
    dividerColor: const Color(0xffDD4A30),
  );
}
