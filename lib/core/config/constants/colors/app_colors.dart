import 'package:flutter/material.dart';
import 'package:test_project/core/config/constants/colors/dark_colors.dart';
import 'package:test_project/core/config/constants/colors/light_colors.dart';

/// Renk paletini döndüren yardımcı sınıf
class AppColors {
  /// Mevcut tema moduna göre doğru renk paletini döndürür
  static bool _isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // === PRIMARY COLORS ===
  static Color primary(BuildContext context) =>
      _isDark(context) ? DarkColors.primary : LightColors.primary;

  static Color onPrimary(BuildContext context) =>
      _isDark(context) ? DarkColors.onPrimary : LightColors.onPrimary;

  static Color primaryContainer(BuildContext context) => _isDark(context)
      ? DarkColors.primaryContainer
      : LightColors.primaryContainer;

  static Color onPrimaryContainer(BuildContext context) => _isDark(context)
      ? DarkColors.onPrimaryContainer
      : LightColors.onPrimaryContainer;

  // === SECONDARY COLORS ===
  static Color secondary(BuildContext context) =>
      _isDark(context) ? DarkColors.secondary : LightColors.secondary;

  static Color onSecondary(BuildContext context) =>
      _isDark(context) ? DarkColors.onSecondary : LightColors.onSecondary;

  static Color secondaryContainer(BuildContext context) => _isDark(context)
      ? DarkColors.secondaryContainer
      : LightColors.secondaryContainer;

  static Color onSecondaryContainer(BuildContext context) => _isDark(context)
      ? DarkColors.onSecondaryContainer
      : LightColors.onSecondaryContainer;

  // === TERTIARY COLORS ===
  static Color tertiary(BuildContext context) =>
      _isDark(context) ? DarkColors.tertiary : LightColors.tertiary;

  static Color onTertiary(BuildContext context) =>
      _isDark(context) ? DarkColors.onTertiary : LightColors.onTertiary;

  static Color tertiaryContainer(BuildContext context) => _isDark(context)
      ? DarkColors.tertiaryContainer
      : LightColors.tertiaryContainer;

  static Color onTertiaryContainer(BuildContext context) => _isDark(context)
      ? DarkColors.onTertiaryContainer
      : LightColors.onTertiaryContainer;

  // === BACKGROUND & SURFACE ===
  static Color background(BuildContext context) =>
      _isDark(context) ? DarkColors.background : LightColors.background;

  static Color onBackground(BuildContext context) =>
      _isDark(context) ? DarkColors.onBackground : LightColors.onBackground;

  static Color surface(BuildContext context) =>
      _isDark(context) ? DarkColors.surface : LightColors.surface;

  static Color onSurface(BuildContext context) =>
      _isDark(context) ? DarkColors.onSurface : LightColors.onSurface;

  static Color surfaceVariant(BuildContext context) =>
      _isDark(context) ? DarkColors.surfaceVariant : LightColors.surfaceVariant;

  static Color onSurfaceVariant(BuildContext context) => _isDark(context)
      ? DarkColors.onSurfaceVariant
      : LightColors.onSurfaceVariant;

  // === ERROR COLORS ===
  static Color error(BuildContext context) =>
      _isDark(context) ? DarkColors.error : LightColors.error;

  static Color onError(BuildContext context) =>
      _isDark(context) ? DarkColors.onError : LightColors.onError;

  static Color errorContainer(BuildContext context) =>
      _isDark(context) ? DarkColors.errorContainer : LightColors.errorContainer;

  static Color onErrorContainer(BuildContext context) => _isDark(context)
      ? DarkColors.onErrorContainer
      : LightColors.onErrorContainer;

  // === SUCCESS COLORS ===
  static Color success(BuildContext context) =>
      _isDark(context) ? DarkColors.success : LightColors.success;

  static Color onSuccess(BuildContext context) =>
      _isDark(context) ? DarkColors.onSuccess : LightColors.onSuccess;

  static Color successContainer(BuildContext context) => _isDark(context)
      ? DarkColors.successContainer
      : LightColors.successContainer;

  static Color onSuccessContainer(BuildContext context) => _isDark(context)
      ? DarkColors.onSuccessContainer
      : LightColors.onSuccessContainer;

  // === WARNING COLORS ===
  static Color warning(BuildContext context) =>
      _isDark(context) ? DarkColors.warning : LightColors.warning;

  static Color onWarning(BuildContext context) =>
      _isDark(context) ? DarkColors.onWarning : LightColors.onWarning;

  static Color warningContainer(BuildContext context) => _isDark(context)
      ? DarkColors.warningContainer
      : LightColors.warningContainer;

  static Color onWarningContainer(BuildContext context) => _isDark(context)
      ? DarkColors.onWarningContainer
      : LightColors.onWarningContainer;

  // === INFO COLORS ===
  static Color info(BuildContext context) =>
      _isDark(context) ? DarkColors.info : LightColors.info;

  static Color onInfo(BuildContext context) =>
      _isDark(context) ? DarkColors.onInfo : LightColors.onInfo;

  static Color infoContainer(BuildContext context) =>
      _isDark(context) ? DarkColors.infoContainer : LightColors.infoContainer;

  static Color onInfoContainer(BuildContext context) => _isDark(context)
      ? DarkColors.onInfoContainer
      : LightColors.onInfoContainer;

  // === OUTLINE & BORDERS ===
  static Color outline(BuildContext context) =>
      _isDark(context) ? DarkColors.outline : LightColors.outline;

  static Color outlineVariant(BuildContext context) =>
      _isDark(context) ? DarkColors.outlineVariant : LightColors.outlineVariant;

  static Color shadow(BuildContext context) =>
      _isDark(context) ? DarkColors.shadow : LightColors.shadow;

  static Color scrim(BuildContext context) =>
      _isDark(context) ? DarkColors.scrim : LightColors.scrim;

  // === COMPONENT SPECIFIC COLORS ===

  // AppBar
  static Color appBarBackground(BuildContext context) => _isDark(context)
      ? DarkColors.appBarBackground
      : LightColors.appBarBackground;

  static Color appBarForeground(BuildContext context) => _isDark(context)
      ? DarkColors.appBarForeground
      : LightColors.appBarForeground;

  // Bottom Navigation Bar
  static Color bottomNavBackground(BuildContext context) => _isDark(context)
      ? DarkColors.bottomNavBackground
      : LightColors.bottomNavBackground;

  static Color bottomNavSelected(BuildContext context) => _isDark(context)
      ? DarkColors.bottomNavSelected
      : LightColors.bottomNavSelected;

  static Color bottomNavUnselected(BuildContext context) => _isDark(context)
      ? DarkColors.bottomNavUnselected
      : LightColors.bottomNavUnselected;

  // Cards
  static Color cardBackground(BuildContext context) =>
      _isDark(context) ? DarkColors.cardBackground : LightColors.cardBackground;

  static Color cardShadow(BuildContext context) =>
      _isDark(context) ? DarkColors.cardShadow : LightColors.cardShadow;

  static Color cardBorder(BuildContext context) =>
      _isDark(context) ? DarkColors.cardBorder : LightColors.cardBorder;

  // Buttons
  static Color buttonPrimary(BuildContext context) =>
      _isDark(context) ? DarkColors.buttonPrimary : LightColors.buttonPrimary;

  static Color buttonSecondary(BuildContext context) => _isDark(context)
      ? DarkColors.buttonSecondary
      : LightColors.buttonSecondary;

  static Color buttonDisabled(BuildContext context) =>
      _isDark(context) ? DarkColors.buttonDisabled : LightColors.buttonDisabled;

  static Color onButtonDisabled(BuildContext context) => _isDark(context)
      ? DarkColors.onButtonDisabled
      : LightColors.onButtonDisabled;

  // Text Fields
  static Color textFieldBackground(BuildContext context) => _isDark(context)
      ? DarkColors.textFieldBackground
      : LightColors.textFieldBackground;

  static Color textFieldBorder(BuildContext context) => _isDark(context)
      ? DarkColors.textFieldBorder
      : LightColors.textFieldBorder;

  static Color textFieldBorderFocused(BuildContext context) => _isDark(context)
      ? DarkColors.textFieldBorderFocused
      : LightColors.textFieldBorderFocused;

  static Color textFieldBorderError(BuildContext context) => _isDark(context)
      ? DarkColors.textFieldBorderError
      : LightColors.textFieldBorderError;

  static Color textFieldHint(BuildContext context) =>
      _isDark(context) ? DarkColors.textFieldHint : LightColors.textFieldHint;

  static Color textFieldText(BuildContext context) =>
      _isDark(context) ? DarkColors.textFieldText : LightColors.textFieldText;

  static Color textFieldLabel(BuildContext context) =>
      _isDark(context) ? DarkColors.textFieldLabel : LightColors.textFieldLabel;

  // Dividers
  static Color divider(BuildContext context) =>
      _isDark(context) ? DarkColors.divider : LightColors.divider;

  static Color dividerThick(BuildContext context) =>
      _isDark(context) ? DarkColors.dividerThick : LightColors.dividerThick;

  // Chips & Tags
  static Color chipBackground(BuildContext context) =>
      _isDark(context) ? DarkColors.chipBackground : LightColors.chipBackground;

  static Color chipForeground(BuildContext context) =>
      _isDark(context) ? DarkColors.chipForeground : LightColors.chipForeground;

  static Color chipBorder(BuildContext context) =>
      _isDark(context) ? DarkColors.chipBorder : LightColors.chipBorder;

  // Icons
  static Color iconPrimary(BuildContext context) =>
      _isDark(context) ? DarkColors.iconPrimary : LightColors.iconPrimary;

  static Color iconSecondary(BuildContext context) =>
      _isDark(context) ? DarkColors.iconSecondary : LightColors.iconSecondary;

  static Color iconDisabled(BuildContext context) =>
      _isDark(context) ? DarkColors.iconDisabled : LightColors.iconDisabled;

  // Overlay & Backdrop
  static Color overlay(BuildContext context) =>
      _isDark(context) ? DarkColors.overlay : LightColors.overlay;

  static Color backdrop(BuildContext context) =>
      _isDark(context) ? DarkColors.backdrop : LightColors.backdrop;

  // Status colors
  static Color disabled(BuildContext context) =>
      _isDark(context) ? DarkColors.disabled : LightColors.disabled;

  static Color inactive(BuildContext context) =>
      _isDark(context) ? DarkColors.inactive : LightColors.inactive;

  AppColors._(); // Private constructor
}
