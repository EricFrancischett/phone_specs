import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color titleGrey = Color(0xFF414141);
  static const Color subtitleGrey = Color(0xFF838383);
  static const Color brandCardColor = Color(0xFFFFFFFF);
  static const Color backgroungColor = Color.fromARGB(255, 205, 205, 205);

  static ThemeData theme = ThemeData(
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: titleGrey,
        fontFamily: GoogleFonts.sourceSansPro().fontFamily,
        letterSpacing: 1,
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: titleGrey,
        fontFamily: GoogleFonts.sourceSansPro().fontFamily,
        letterSpacing: 1,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: subtitleGrey,
        fontFamily: GoogleFonts.sourceSansPro().fontFamily,
      ),
      headlineLarge: TextStyle(
        fontSize: 40,
        
        fontWeight: FontWeight.w600,
        color: titleGrey,
        fontFamily: GoogleFonts.sourceSansPro().fontFamily,
      ),
        headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: titleGrey,
        fontFamily: GoogleFonts.sourceSansPro().fontFamily,
      ),
    ),
  );
}
