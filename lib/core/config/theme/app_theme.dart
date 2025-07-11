import 'package:flutter/material.dart';
import 'package:test_project/core/config/constants/assets/app_font_styles.dart';

class AppThemes {
  static ThemeData get light => ThemeData(
    fontFamily: AppFontStyles.kanit.fontName,
    useMaterial3: true,
    brightness: Brightness.light,
    // Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.blue, // Text color
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.blue,
        side: const BorderSide(color: Colors.blue), // Border color
      ),
    ),
    // Card theme
    cardTheme: CardThemeData(
      color: Colors.white, // Card background color
      elevation: 4, // Shadow for card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
    ),
    // Chip theme
    chipTheme: ChipThemeData(
      backgroundColor: Colors.blue.shade100, // Chip background color
      selectedColor: Colors.blue, // Selected color
      disabledColor: Colors.grey, // Disabled color
      shape: const StadiumBorder(),
      labelStyle: TextStyle(
        color: Colors.blue.shade800, // Text color inside chip
      ),
      padding: const EdgeInsets.all(6),
    ),
    // Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade200, // Background color of text fields
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
        borderSide: const BorderSide(color: Colors.blue), // Border color
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.blue.shade700,
        ), // Focused border color
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.blue.shade300,
        ), // Enabled border color
      ),
      labelStyle: TextStyle(
        color: Colors.blue.shade800, // Label color
      ),
      hintStyle: TextStyle(
        color: Colors.blue.shade400, // Hint text color
      ),
    ),
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    fontFamily: AppFontStyles.kanit.fontName,
    brightness: Brightness.dark,
    // Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade800, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.blue.shade300, // Text color
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.blue.shade300,
        side: BorderSide(color: Colors.blue.shade500), // Border color
      ),
    ),
    // Card theme
    cardTheme: CardThemeData(
      color: Colors.grey.shade800, // Card background color
      elevation: 6, // Shadow for card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
    ),
    // Chip theme
    chipTheme: ChipThemeData(
      backgroundColor: Colors.blue.shade700, // Chip background color
      selectedColor: Colors.blue, // Selected color
      disabledColor: Colors.grey.shade600, // Disabled color
      shape: const StadiumBorder(),
      labelStyle: const TextStyle(
        color: Colors.white, // Text color inside chip
      ),
      padding: const EdgeInsets.all(6),
    ),
    // Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade700, // Background color of text fields
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
        borderSide: BorderSide(color: Colors.blue.shade500), // Border color
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.blue.shade300,
        ), // Focused border color
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.blue.shade400,
        ), // Enabled border color
      ),
      labelStyle: TextStyle(
        color: Colors.blue.shade300, // Label color
      ),
      hintStyle: TextStyle(
        color: Colors.blue.shade200, // Hint text color
      ),
    ),
  );
}
