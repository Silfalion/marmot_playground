import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildLightTheme() {
  return ThemeData(
    textTheme: GoogleFonts.k2dTextTheme().apply(
      bodyColor: const Color(0xff2D2C4E),
      displayColor: const Color(0xff2D2C4E),
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xffFEFFDD),
  );
}

ThemeData buildDarkTheme() {
  return ThemeData(
    textTheme: GoogleFonts.k2dTextTheme().apply(
      bodyColor: const Color(0xffFEFFDD),
      displayColor: const Color(0xffFEFFDD),
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff2D2C4E),
  );
}
