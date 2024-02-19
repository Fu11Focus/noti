import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noti/util/colors.dart';

ThemeData mainThemeData = ThemeData(
    appBarTheme: const AppBarTheme(
        backgroundColor: dark, elevation: 0, foregroundColor: white),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: dark,
    ),
    textTheme: TextTheme(
        //warning massage
        labelMedium: GoogleFonts.roboto(
            color: red, fontSize: 14, fontWeight: FontWeight.w500),
        //for title of page
        titleLarge: GoogleFonts.roboto(
            textStyle: const TextStyle(
                fontWeight: FontWeight.w700, fontSize: 16, color: white)),
        //text of display
        displayLarge: GoogleFonts.roboto(
            textStyle: const TextStyle(
                fontWeight: FontWeight.w700, fontSize: 24, color: dark)),
        displaySmall: GoogleFonts.roboto(
            textStyle: const TextStyle(
                fontWeight: FontWeight.w400, fontSize: 16, color: grey)),
        displayMedium: GoogleFonts.roboto(
            textStyle: const TextStyle(
                fontWeight: FontWeight.w700, fontSize: 32, color: dark))),
    inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: hintTxt,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: purple,
            )),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        hintStyle: GoogleFonts.roboto(fontSize: 16, color: hintTxt)));
