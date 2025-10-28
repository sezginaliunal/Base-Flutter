import 'package:flutter/material.dart';
import 'package:test_project/core/config/constants/colors/dark_colors.dart';
import 'package:test_project/core/config/constants/colors/light_colors.dart';

/// Renk paletini döndüren yardımcı sınıf
class AppColors {
  /// Mevcut tema moduna göre doğru renk paletini döndürür
  static bool _isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // Primary colors
  static Color primary(BuildContext context) =>
      _isDark(context) ? DarkColors.primary : LightColors.primary;

  static Color onPrimary(BuildContext context) =>
      _isDark(context) ? DarkColors.onPrimary : LightColors.onPrimary;

  static Color primaryContainer(BuildContext context) => _isDark(context)
      ? DarkColors.primaryContainer
      : LightColors.primaryContainer;

  // Secondary colors
  static Color secondary(BuildContext context) =>
      _isDark(context) ? DarkColors.secondary : LightColors.secondary;

  // Background & Surface
  static Color background(BuildContext context) =>
      _isDark(context) ? DarkColors.background : LightColors.background;

  static Color surface(BuildContext context) =>
      _isDark(context) ? DarkColors.surface : LightColors.surface;

  // Error colors
  static Color error(BuildContext context) =>
      _isDark(context) ? DarkColors.error : LightColors.error;

  // Success colors
  static Color success(BuildContext context) =>
      _isDark(context) ? DarkColors.success : LightColors.success;

  // Warning colors
  static Color warning(BuildContext context) =>
      _isDark(context) ? DarkColors.warning : LightColors.warning;

  // Component specific
  static Color cardBackground(BuildContext context) =>
      _isDark(context) ? DarkColors.cardBackground : LightColors.cardBackground;

  static Color textFieldBackground(BuildContext context) => _isDark(context)
      ? DarkColors.textFieldBackground
      : LightColors.textFieldBackground;

  static Color divider(BuildContext context) =>
      _isDark(context) ? DarkColors.divider : LightColors.divider;

  AppColors._(); // Private constructor
}
