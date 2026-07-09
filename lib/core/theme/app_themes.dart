import 'package:flutter/material.dart';
import 'app_theme_extension.dart';

/// Light theme configuration
class AppLightTheme {
  static ThemeData get themeData {
    const extension = AppThemeExtension(
      // Primary
      primary: Color(0xFF6750A4),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFEADDFF),
      onPrimaryContainer: Color(0xFF21005D),
      // Secondary
      secondary: Color(0xFF625B71),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFE8DEF8),
      onSecondaryContainer: Color(0xFF1D192B),
      // Tertiary
      tertiary: Color(0xFF7D5260),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFFFD8E4),
      onTertiaryContainer: Color(0xFF31111D),
      // Error
      error: Color(0xFFB3261E),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFF9DEDC),
      onErrorContainer: Color(0xFF410E0B),
      // Surface
      surface: Color(0xFFFFFBFE),
      onSurface: Color(0xFF1C1B1F),
      surfaceVariant: Color(0xFFE7E0EC),
      onSurfaceVariant: Color(0xFF49454F),
      surfaceContainerHighest: Color(0xFFE7E0EC),
      surfaceContainer: Color(0xFFF3EDF7),
      surfaceContainerLow: Color(0xFFF7F2FA),
      surfaceContainerHigh: Color(0xFFECE6F0),
      // Background
      background: Color(0xFFFFFBFE),
      onBackground: Color(0xFF1C1B1F),
      // Outline
      outline: Color(0xFF79747E),
      outlineVariant: Color(0xFFCAC4D0),
      // Inverse
      inverseSurface: Color(0xFF313033),
      onInverseSurface: Color(0xFFF4EFF4),
      inversePrimary: Color(0xFFD0BCFF),
      // Shadow
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      // Spacing
      spacingXs: 4.0,
      spacingSm: 8.0,
      spacingMd: 16.0,
      spacingLg: 24.0,
      spacingXl: 32.0,
      spacing2Xl: 48.0,
      // Border Radius
      radiusXs: 4.0,
      radiusSm: 8.0,
      radiusMd: 12.0,
      radiusLg: 16.0,
      radiusXl: 24.0,
      radiusFull: 9999.0,
      // Elevation
      elevationXs: 1.0,
      elevationSm: 3.0,
      elevationMd: 6.0,
      elevationLg: 8.0,
      elevationXl: 12.0,
      // Typography
      fontSizeXs: 10.0,
      fontSizeSm: 12.0,
      fontSizeMd: 14.0,
      fontSizeLg: 16.0,
      fontSizeXl: 20.0,
      fontSize2Xl: 24.0,
      fontSize3Xl: 30.0,
      fontSize4Xl: 36.0,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF6750A4),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFFEADDFF),
        onPrimaryContainer: Color(0xFF21005D),
        secondary: Color(0xFF625B71),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFE8DEF8),
        onSecondaryContainer: Color(0xFF1D192B),
        tertiary: Color(0xFF7D5260),
        onTertiary: Color(0xFFFFFFFF),
        tertiaryContainer: Color(0xFFFFD8E4),
        onTertiaryContainer: Color(0xFF31111D),
        error: Color(0xFFB3261E),
        onError: Color(0xFFFFFFFF),
        errorContainer: Color(0xFFF9DEDC),
        onErrorContainer: Color(0xFF410E0B),
        surface: Color(0xFFFFFBFE),
        onSurface: Color(0xFF1C1B1F),
        surfaceContainerHighest: Color(0xFFE7E0EC),
        onSurfaceVariant: Color(0xFF49454F),
        outline: Color(0xFF79747E),
        outlineVariant: Color(0xFFCAC4D0),
        inverseSurface: Color(0xFF313033),
        onInverseSurface: Color(0xFFF4EFF4),
        inversePrimary: Color(0xFFD0BCFF),
        shadow: Color(0xFF000000),
        scrim: Color(0xFF000000),
      ),
      extensions: [extension],
    );
  }
}

/// Dark theme configuration
class AppDarkTheme {
  static ThemeData get themeData {
    const extension = AppThemeExtension(
      // Primary
      primary: Color(0xFFD0BCFF),
      onPrimary: Color(0xFF381E72),
      primaryContainer: Color(0xFF4F378B),
      onPrimaryContainer: Color(0xFFEADDFF),
      // Secondary
      secondary: Color(0xFFCCC2DC),
      onSecondary: Color(0xFF332D41),
      secondaryContainer: Color(0xFF4A4458),
      onSecondaryContainer: Color(0xFFE8DEF8),
      // Tertiary
      tertiary: Color(0xFFEFB8C8),
      onTertiary: Color(0xFF492532),
      tertiaryContainer: Color(0xFF633B48),
      onTertiaryContainer: Color(0xFFFFD8E4),
      // Error
      error: Color(0xFFF2B8B5),
      onError: Color(0xFF601410),
      errorContainer: Color(0xFF8C1D18),
      onErrorContainer: Color(0xFFF9DEDC),
      // Surface
      surface: Color(0xFF1C1B1F),
      onSurface: Color(0xFFE6E1E5),
      surfaceVariant: Color(0xFF49454F),
      onSurfaceVariant: Color(0xFFCAC4D0),
      surfaceContainerHighest: Color(0xFF49454F),
      surfaceContainer: Color(0xFF2B2930),
      surfaceContainerLow: Color(0xFF1F1E23),
      surfaceContainerHigh: Color(0xFF313033),
      // Background
      background: Color(0xFF1C1B1F),
      onBackground: Color(0xFFE6E1E5),
      // Outline
      outline: Color(0xFF938F99),
      outlineVariant: Color(0xFF49454F),
      // Inverse
      inverseSurface: Color(0xFFE6E1E5),
      onInverseSurface: Color(0xFF313033),
      inversePrimary: Color(0xFF6750A4),
      // Shadow
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      // Spacing
      spacingXs: 4.0,
      spacingSm: 8.0,
      spacingMd: 16.0,
      spacingLg: 24.0,
      spacingXl: 32.0,
      spacing2Xl: 48.0,
      // Border Radius
      radiusXs: 4.0,
      radiusSm: 8.0,
      radiusMd: 12.0,
      radiusLg: 16.0,
      radiusXl: 24.0,
      radiusFull: 9999.0,
      // Elevation
      elevationXs: 1.0,
      elevationSm: 3.0,
      elevationMd: 6.0,
      elevationLg: 8.0,
      elevationXl: 12.0,
      // Typography
      fontSizeXs: 10.0,
      fontSizeSm: 12.0,
      fontSizeMd: 14.0,
      fontSizeLg: 16.0,
      fontSizeXl: 20.0,
      fontSize2Xl: 24.0,
      fontSize3Xl: 30.0,
      fontSize4Xl: 36.0,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFD0BCFF),
        onPrimary: Color(0xFF381E72),
        primaryContainer: Color(0xFF4F378B),
        onPrimaryContainer: Color(0xFFEADDFF),
        secondary: Color(0xFFCCC2DC),
        onSecondary: Color(0xFF332D41),
        secondaryContainer: Color(0xFF4A4458),
        onSecondaryContainer: Color(0xFFE8DEF8),
        tertiary: Color(0xFFEFB8C8),
        onTertiary: Color(0xFF492532),
        tertiaryContainer: Color(0xFF633B48),
        onTertiaryContainer: Color(0xFFFFD8E4),
        error: Color(0xFFF2B8B5),
        onError: Color(0xFF601410),
        errorContainer: Color(0xFF8C1D18),
        onErrorContainer: Color(0xFFF9DEDC),
        surface: Color(0xFF1C1B1F),
        onSurface: Color(0xFFE6E1E5),
        surfaceContainerHighest: Color(0xFF49454F),
        onSurfaceVariant: Color(0xFFCAC4D0),
        outline: Color(0xFF938F99),
        outlineVariant: Color(0xFF49454F),
        inverseSurface: Color(0xFFE6E1E5),
        onInverseSurface: Color(0xFF313033),
        inversePrimary: Color(0xFF6750A4),
        shadow: Color(0xFF000000),
        scrim: Color(0xFF000000),
      ),
      extensions: [extension],
    );
  }
}
