import 'package:flutter/material.dart';

/// Dark Mode için renk paleti - Minimal Siyah/Beyaz Tema
class DarkColors {
  // === PRIMARY COLORS === (Beyaz/Açık Gri)
  static const primary = Color(0xFFFAFAFA);
  static const onPrimary = Color(0xFF09090B);
  static const primaryContainer = Color(0xFF27272A);
  static const onPrimaryContainer = Color(0xFFFAFAFA);

  // === SECONDARY COLORS === (Orta Gri)
  static const secondary = Color(0xFFA1A1AA);
  static const onSecondary = Color(0xFF18181B);
  static const secondaryContainer = Color(0xFF3F3F46);
  static const onSecondaryContainer = Color(0xFFE4E4E7);

  // === TERTIARY COLORS === (Hafif Accent - İnce Mavi)
  static const tertiary = Color(0xFF60A5FA);
  static const onTertiary = Color(0xFF09090B);
  static const tertiaryContainer = Color(0xFF1E3A8A);
  static const onTertiaryContainer = Color(0xFFDBEAFE);

  // === BACKGROUND & SURFACE ===
  static const background = Color(0xFF09090B);
  static const onBackground = Color(0xFFFAFAFA);
  static const surface = Color(0xFF09090B);
  static const onSurface = Color(0xFFFAFAFA);
  static const surfaceVariant = Color(0xFF18181B);
  static const onSurfaceVariant = Color(0xFFD4D4D8);

  // === ERROR COLORS ===
  static const error = Color(0xFFFAFAFA);
  static const onError = Color(0xFF09090B);
  static const errorContainer = Color(0xFF27272A);
  static const onErrorContainer = Color(0xFFFAFAFA);

  // === SUCCESS COLORS ===
  static const success = Color(0xFFFAFAFA);
  static const onSuccess = Color(0xFF09090B);
  static const successContainer = Color(0xFF27272A);
  static const onSuccessContainer = Color(0xFFFAFAFA);

  // === WARNING COLORS ===
  static const warning = Color(0xFFD4D4D8);
  static const onWarning = Color(0xFF09090B);
  static const warningContainer = Color(0xFF3F3F46);
  static const onWarningContainer = Color(0xFFFAFAFA);

  // === INFO COLORS ===
  static const info = Color(0xFFA1A1AA);
  static const onInfo = Color(0xFF09090B);
  static const infoContainer = Color(0xFF27272A);
  static const onInfoContainer = Color(0xFFFAFAFA);

  // === OUTLINE & BORDERS ===
  static const outline = Color(0xFF27272A);
  static const outlineVariant = Color(0xFF18181B);
  static const shadow = Color(0xFF000000);
  static const scrim = Color(0xFF000000);

  // === COMPONENT SPECIFIC COLORS ===
  // AppBar
  static const appBarBackground = Color(0xFF09090B);
  static const appBarForeground = Color(0xFFFAFAFA);

  // Bottom Navigation Bar
  static const bottomNavBackground = Color(0xFF09090B);
  static const bottomNavSelected = Color(0xFFFAFAFA);
  static const bottomNavUnselected = Color(0xFF71717A);

  // Cards
  static const cardBackground = Color(0xFF18181B);
  static const cardShadow = Color(0x33000000);
  static const cardBorder = Color(0xFF27272A);

  // Buttons
  static const buttonPrimary = Color(0xFFFAFAFA);
  static const buttonSecondary = Color(0xFF27272A);
  static const buttonDisabled = Color(0xFF18181B);
  static const onButtonDisabled = Color(0xFF52525B);

  // Text Fields
  static const textFieldBackground = Color(0xFF18181B);
  static const textFieldBorder = Color(0xFF27272A);
  static const textFieldBorderFocused = Color(0xFFFAFAFA);
  static const textFieldBorderError = Color(0xFF71717A);
  static const textFieldHint = Color(0xFF71717A);
  static const textFieldText = Color(0xFFFAFAFA);
  static const textFieldLabel = Color(0xFFA1A1AA);

  // Dividers
  static const divider = Color(0xFF27272A);
  static const dividerThick = Color(0xFF3F3F46);

  // Chips & Tags
  static const chipBackground = Color(0xFF27272A);
  static const chipForeground = Color(0xFFFAFAFA);
  static const chipBorder = Color(0xFF3F3F46);

  // Icons
  static const iconPrimary = Color(0xFFFAFAFA);
  static const iconSecondary = Color(0xFFA1A1AA);
  static const iconDisabled = Color(0xFF52525B);

  // Overlay & Backdrop
  static const overlay = Color(0x33000000);
  static const backdrop = Color(0xE6000000);

  // Status colors
  static const disabled = Color(0xFF18181B);
  static const inactive = Color(0xFF27272A);

  DarkColors._(); // Private constructor to prevent instantiation
}
