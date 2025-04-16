import 'package:flutter/material.dart';
import 'colors.dart'; // Import your color definitions

class AppTheme {
  static ThemeData get darkTheme {
    return _createTheme(
      brightness: Brightness.dark,
      primary: AppColors.matteBlack,
      onPrimary: AppColors.offWhite,
      secondary: AppColors.darkEmeraldGreen,
      onSecondary: AppColors.offWhite,
      background: AppColors.richCharcoalGray,
      onBackground: AppColors.offWhite,
      surface: AppColors.matteBlack,
      onSurface: AppColors.offWhite,
      shadow: Colors.black54,
    );
  }

  static ThemeData get lightTheme {
    return _createTheme(
      brightness: Brightness.light,
      primary: AppColors.offWhite,
      onPrimary: AppColors.matteBlack,
      secondary: AppColors.darkEmeraldGreen,
      onSecondary: AppColors.offWhite,
      background: AppColors.offWhite,
      onBackground: AppColors.matteBlack,
      surface: AppColors.offWhite,
      onSurface: AppColors.matteBlack,
      shadow: Colors.grey.withOpacity(0.3),
    );
  }

  static ThemeData _createTheme({
    required Brightness brightness,
    required Color primary,
    required Color onPrimary,
    required Color secondary,
    required Color onSecondary,
    required Color background,
    required Color onBackground,
    required Color surface,
    required Color onSurface,
    required Color shadow,
  }) {
    final isDark = brightness == Brightness.dark;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      primaryColor: primary,
      scaffoldBackgroundColor: background,
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        elevation: 0,
        iconTheme: IconThemeData(color: onBackground),
        titleTextStyle: TextStyle(
          color: onBackground,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: primary,
        onPrimary: onPrimary,
        secondary: secondary,
        onSecondary: onSecondary,
        error: Colors.red,
        onError: Colors.white,
        background: background,
        onBackground: onBackground,
        surface: surface,
        onSurface: onSurface,
      ),
      cardTheme: CardTheme(
        color: isDark ? AppColors.matteBlack : AppColors.offWhite,
        elevation: 4,
        shadowColor: shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: secondary,
          foregroundColor: onSecondary,
          elevation: 4,
          shadowColor: shadow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
            color: onBackground,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: shadow,
                offset: const Offset(5.0, 5.0),
              ),
            ]),
        displayMedium: TextStyle(
            fontSize: 56,
            fontWeight: FontWeight.bold,
            color: onBackground,
            shadows: [
              Shadow(
                blurRadius: 8.0,
                color: shadow,
                offset: const Offset(4.0, 4.0),
              ),
            ]),
        displaySmall: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: onBackground,
            shadows: [
              Shadow(
                blurRadius: 6.0,
                color: shadow,
                offset: const Offset(3.0, 3.0),
              ),
            ]),
        headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: onBackground,
            shadows: [
              Shadow(
                blurRadius: 5.0,
                color: shadow,
                offset: const Offset(2.0, 2.0),
              ),
            ]),
        headlineMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: onBackground,
            shadows: [
              Shadow(
                blurRadius: 4.0,
                color: shadow,
                offset: const Offset(2.0, 2.0),
              ),
            ]),
        headlineSmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: onBackground,
            shadows: [
              Shadow(
                blurRadius: 3.0,
                color: shadow,
                offset: const Offset(1.0, 1.0),
              ),
            ]),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: onBackground,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: onBackground,
        ),
        titleSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: onBackground,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          color: onBackground,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: onBackground,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          color: onBackground,
        ),
      ),
    );
  }
}
