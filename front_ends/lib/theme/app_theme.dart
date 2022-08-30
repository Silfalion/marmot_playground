import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color lightColor = Color(0xffFEFFDD);
const Color darkColor = Color(0xff2D2C4E);

ThemeData buildTheme({bool isDark = false}) {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textTheme: GoogleFonts.k2dTextTheme().apply(
      bodyColor: isDark ? darkColor : lightColor,
      displayColor: isDark ? darkColor : lightColor,
    ),
    brightness: isDark ? Brightness.dark : Brightness.light,
    scaffoldBackgroundColor: isDark ? lightColor : darkColor,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: isDark ? darkColor : lightColor,
        primary: isDark ? lightColor : darkColor,
      ),
    ),
  );
}
