import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app.colors.dart';

ThemeData getAppTheme() {
  return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        centerTitle: true,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.lato(
          color: AppColors.white,
          fontSize: 32,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: GoogleFonts.lato(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        displaySmall: GoogleFonts.lato(
          color: AppColors.white.withOpacity(0.44),
          fontSize: 16,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            )),
      ));
}

ThemeData getAppDarkTheme() {
  return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.red,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.red,
        centerTitle: true,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.lato(
          color: AppColors.white,
          fontSize: 32,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: GoogleFonts.lato(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        displaySmall: GoogleFonts.lato(
          color: AppColors.white.withOpacity(0.44),
          fontSize: 16,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            )),
      ));
}
