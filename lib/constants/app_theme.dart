import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xff3B3C40);
  static const Color secondaryColor = Color(0xff848484);

  final theme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      // colorScheme: ColorScheme.light(
      //   primary: primaryColor,
      //   onPrimary: Colors.white,
      // ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(.8),
            width: 1.0,
          ),
        ),
        labelStyle: const TextStyle(color: primaryColor),
        hintStyle: const TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: primaryColor,
            width: 1.0,
          ),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: primaryColor,
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
      primaryColor: primaryColor,
      secondaryHeaderColor: secondaryColor,
      disabledColor: const Color(0xffF3F3F5),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          backgroundColor: Colors.white,
          unselectedItemColor: primaryColor.withOpacity(.5)),
      textTheme: getTextTheme());
}

getTextTheme() {
  return TextTheme(
      //title
      titleLarge: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.w700),
      titleMedium: GoogleFonts.inter(),
      titleSmall: GoogleFonts.inter(),

      //headline
      headlineLarge: GoogleFonts.inter(
        color: const Color(0xff242424),
        fontSize: 18,
        letterSpacing: 1,
      ),
      headlineMedium: GoogleFonts.inter(),
      headlineSmall: GoogleFonts.inter(),

      //body
      bodyLarge: GoogleFonts.inter(),
      bodyMedium: GoogleFonts.inter(),
      bodySmall: GoogleFonts.inter(),

    // display
    displayLarge: GoogleFonts.inter(),
    displayMedium: GoogleFonts.inter(),
    displaySmall: GoogleFonts.inter(),







      );
}
