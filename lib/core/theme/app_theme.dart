import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

/// Konfigurasi tema global yang menerjemahkan design token web ke Flutter.
class AppTheme {
  AppTheme._();

  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.brown,
      brightness: Brightness.light,
      primary: AppColors.brown,
      secondary: AppColors.actionAccent,
      surface: AppColors.card,
      error: AppColors.danger,
    );

    return ThemeData(
      useMaterial3: true,
      fontFamily: AppFonts.garamond,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.homeCream,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.navbarStart,
        foregroundColor: AppColors.navbarText,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.navbarText,
          fontFamily: AppFonts.garamond,
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.card,
        elevation: 4,
        shadowColor: AppColors.cardShadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.border),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.brown,
          foregroundColor: AppColors.creamLight,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: const TextStyle(
            fontFamily: AppFonts.plusJakartaSans,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          shape: const StadiumBorder(),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.upcyclingSurface,
        labelStyle: const TextStyle(
          fontFamily: AppFonts.plusJakartaSans,
          color: AppColors.brown,
        ),
        hintStyle: const TextStyle(
          fontFamily: AppFonts.plusJakartaSans,
          color: AppColors.brownMuted,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.brown, width: 2),
        ),
      ),
    );
  }
}
