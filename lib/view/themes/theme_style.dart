import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeStyle() {
  return ThemeData(
    primaryColor: const Color.fromRGBO(109, 152, 134, 1),
    accentColor: const Color.fromRGBO(242, 231, 213, 1),
    textTheme: TextTheme(
      // Setting up headline 6
      headline6: GoogleFonts.lobster(
        fontSize: 36,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      // Setting up heading 5
      headline5: GoogleFonts.caveat(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      // Setting up headline 4
      headline4: GoogleFonts.raleway(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      // Setting up headline 3
      headline3: GoogleFonts.raleway(
        fontSize: 36,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
