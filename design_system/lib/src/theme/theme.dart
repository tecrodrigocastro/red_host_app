import 'package:design_system/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get ligthTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      primaryColorLight: AppColors.primaryVariant,
      colorScheme: ColorScheme.fromSwatch(
        backgroundColor: AppColors.backgroundLigth,
        errorColor: AppColors.secondary,
      ),
      textTheme: TextTheme(
        displayLarge:
            GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.w700),
        displayMedium:
            GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w600),
        displaySmall:
            GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w400),
        headlineLarge:
            GoogleFonts.dmSans(fontSize: 18, fontWeight: FontWeight.w700),
        headlineMedium:
            GoogleFonts.dmSans(fontSize: 18, fontWeight: FontWeight.w600),
        headlineSmall:
            GoogleFonts.dmSans(fontSize: 18, fontWeight: FontWeight.w400),
        titleLarge:
            GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.w700),
        titleMedium:
            GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.w600),
        titleSmall:
            GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.w400),
        bodyLarge:
            GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.w700),
        bodyMedium:
            GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.w600),
        bodySmall:
            GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.w400),
        labelLarge:
            GoogleFonts.dmSans(fontSize: 12, fontWeight: FontWeight.w700),
        labelMedium:
            GoogleFonts.dmSans(fontSize: 12, fontWeight: FontWeight.w600),
        labelSmall:
            GoogleFonts.dmSans(fontSize: 12, fontWeight: FontWeight.w400),
      ),
    );
  }
}
