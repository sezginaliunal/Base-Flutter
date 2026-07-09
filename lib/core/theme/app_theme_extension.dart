import 'package:flutter/material.dart';

/// Custom theme extension for app-specific design tokens
/// All colors, spacing, and typography values should be defined here
@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  // Colors - Primary
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;

  // Colors - Secondary
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;

  // Colors - Tertiary
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;

  // Colors - Error
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;

  // Colors - Surface
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color surfaceContainerHighest;
  final Color surfaceContainer;
  final Color surfaceContainerLow;
  final Color surfaceContainerHigh;

  // Colors - Background
  final Color background;
  final Color onBackground;

  // Colors - Outline
  final Color outline;
  final Color outlineVariant;

  // Colors - Inverse
  final Color inverseSurface;
  final Color onInverseSurface;
  final Color inversePrimary;

  // Colors - Shadow
  final Color shadow;
  final Color scrim;

  // Spacing
  final double spacingXs;
  final double spacingSm;
  final double spacingMd;
  final double spacingLg;
  final double spacingXl;
  final double spacing2Xl;

  // Border Radius
  final double radiusXs;
  final double radiusSm;
  final double radiusMd;
  final double radiusLg;
  final double radiusXl;
  final double radiusFull;

  // Elevation
  final double elevationXs;
  final double elevationSm;
  final double elevationMd;
  final double elevationLg;
  final double elevationXl;

  // Typography
  final double fontSizeXs;
  final double fontSizeSm;
  final double fontSizeMd;
  final double fontSizeLg;
  final double fontSizeXl;
  final double fontSize2Xl;
  final double fontSize3Xl;
  final double fontSize4Xl;

  const AppThemeExtension({
    // Primary
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    // Secondary
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    // Tertiary
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    // Error
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    // Surface
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.surfaceContainerHighest,
    required this.surfaceContainer,
    required this.surfaceContainerLow,
    required this.surfaceContainerHigh,
    // Background
    required this.background,
    required this.onBackground,
    // Outline
    required this.outline,
    required this.outlineVariant,
    // Inverse
    required this.inverseSurface,
    required this.onInverseSurface,
    required this.inversePrimary,
    // Shadow
    required this.shadow,
    required this.scrim,
    // Spacing
    required this.spacingXs,
    required this.spacingSm,
    required this.spacingMd,
    required this.spacingLg,
    required this.spacingXl,
    required this.spacing2Xl,
    // Border Radius
    required this.radiusXs,
    required this.radiusSm,
    required this.radiusMd,
    required this.radiusLg,
    required this.radiusXl,
    required this.radiusFull,
    // Elevation
    required this.elevationXs,
    required this.elevationSm,
    required this.elevationMd,
    required this.elevationLg,
    required this.elevationXl,
    // Typography
    required this.fontSizeXs,
    required this.fontSizeSm,
    required this.fontSizeMd,
    required this.fontSizeLg,
    required this.fontSizeXl,
    required this.fontSize2Xl,
    required this.fontSize3Xl,
    required this.fontSize4Xl,
  });

  @override
  AppThemeExtension copyWith({
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? surface,
    Color? onSurface,
    Color? surfaceVariant,
    Color? onSurfaceVariant,
    Color? surfaceContainerHighest,
    Color? surfaceContainer,
    Color? surfaceContainerLow,
    Color? surfaceContainerHigh,
    Color? background,
    Color? onBackground,
    Color? outline,
    Color? outlineVariant,
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? inversePrimary,
    Color? shadow,
    Color? scrim,
    double? spacingXs,
    double? spacingSm,
    double? spacingMd,
    double? spacingLg,
    double? spacingXl,
    double? spacing2Xl,
    double? radiusXs,
    double? radiusSm,
    double? radiusMd,
    double? radiusLg,
    double? radiusXl,
    double? radiusFull,
    double? elevationXs,
    double? elevationSm,
    double? elevationMd,
    double? elevationLg,
    double? elevationXl,
    double? fontSizeXs,
    double? fontSizeSm,
    double? fontSizeMd,
    double? fontSizeLg,
    double? fontSizeXl,
    double? fontSize2Xl,
    double? fontSize3Xl,
    double? fontSize4Xl,
  }) {
    return AppThemeExtension(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      tertiary: tertiary ?? this.tertiary,
      onTertiary: onTertiary ?? this.onTertiary,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
      surfaceContainerHighest:
          surfaceContainerHighest ?? this.surfaceContainerHighest,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      surfaceContainerLow: surfaceContainerLow ?? this.surfaceContainerLow,
      surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      outline: outline ?? this.outline,
      outlineVariant: outlineVariant ?? this.outlineVariant,
      inverseSurface: inverseSurface ?? this.inverseSurface,
      onInverseSurface: onInverseSurface ?? this.onInverseSurface,
      inversePrimary: inversePrimary ?? this.inversePrimary,
      shadow: shadow ?? this.shadow,
      scrim: scrim ?? this.scrim,
      spacingXs: spacingXs ?? this.spacingXs,
      spacingSm: spacingSm ?? this.spacingSm,
      spacingMd: spacingMd ?? this.spacingMd,
      spacingLg: spacingLg ?? this.spacingLg,
      spacingXl: spacingXl ?? this.spacingXl,
      spacing2Xl: spacing2Xl ?? this.spacing2Xl,
      radiusXs: radiusXs ?? this.radiusXs,
      radiusSm: radiusSm ?? this.radiusSm,
      radiusMd: radiusMd ?? this.radiusMd,
      radiusLg: radiusLg ?? this.radiusLg,
      radiusXl: radiusXl ?? this.radiusXl,
      radiusFull: radiusFull ?? this.radiusFull,
      elevationXs: elevationXs ?? this.elevationXs,
      elevationSm: elevationSm ?? this.elevationSm,
      elevationMd: elevationMd ?? this.elevationMd,
      elevationLg: elevationLg ?? this.elevationLg,
      elevationXl: elevationXl ?? this.elevationXl,
      fontSizeXs: fontSizeXs ?? this.fontSizeXs,
      fontSizeSm: fontSizeSm ?? this.fontSizeSm,
      fontSizeMd: fontSizeMd ?? this.fontSizeMd,
      fontSizeLg: fontSizeLg ?? this.fontSizeLg,
      fontSizeXl: fontSizeXl ?? this.fontSizeXl,
      fontSize2Xl: fontSize2Xl ?? this.fontSize2Xl,
      fontSize3Xl: fontSize3Xl ?? this.fontSize3Xl,
      fontSize4Xl: fontSize4Xl ?? this.fontSize4Xl,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) {
      return this;
    }

    return AppThemeExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      primaryContainer: Color.lerp(
        primaryContainer,
        other.primaryContainer,
        t,
      )!,
      onPrimaryContainer: Color.lerp(
        onPrimaryContainer,
        other.onPrimaryContainer,
        t,
      )!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      secondaryContainer: Color.lerp(
        secondaryContainer,
        other.secondaryContainer,
        t,
      )!,
      onSecondaryContainer: Color.lerp(
        onSecondaryContainer,
        other.onSecondaryContainer,
        t,
      )!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      onTertiary: Color.lerp(onTertiary, other.onTertiary, t)!,
      tertiaryContainer: Color.lerp(
        tertiaryContainer,
        other.tertiaryContainer,
        t,
      )!,
      onTertiaryContainer: Color.lerp(
        onTertiaryContainer,
        other.onTertiaryContainer,
        t,
      )!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      errorContainer: Color.lerp(errorContainer, other.errorContainer, t)!,
      onErrorContainer: Color.lerp(
        onErrorContainer,
        other.onErrorContainer,
        t,
      )!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      onSurfaceVariant: Color.lerp(
        onSurfaceVariant,
        other.onSurfaceVariant,
        t,
      )!,
      surfaceContainerHighest: Color.lerp(
        surfaceContainerHighest,
        other.surfaceContainerHighest,
        t,
      )!,
      surfaceContainer: Color.lerp(
        surfaceContainer,
        other.surfaceContainer,
        t,
      )!,
      surfaceContainerLow: Color.lerp(
        surfaceContainerLow,
        other.surfaceContainerLow,
        t,
      )!,
      surfaceContainerHigh: Color.lerp(
        surfaceContainerHigh,
        other.surfaceContainerHigh,
        t,
      )!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      outlineVariant: Color.lerp(outlineVariant, other.outlineVariant, t)!,
      inverseSurface: Color.lerp(inverseSurface, other.inverseSurface, t)!,
      onInverseSurface: Color.lerp(
        onInverseSurface,
        other.onInverseSurface,
        t,
      )!,
      inversePrimary: Color.lerp(inversePrimary, other.inversePrimary, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      scrim: Color.lerp(scrim, other.scrim, t)!,
      spacingXs: _lerpDouble(spacingXs, other.spacingXs, t)!,
      spacingSm: _lerpDouble(spacingSm, other.spacingSm, t)!,
      spacingMd: _lerpDouble(spacingMd, other.spacingMd, t)!,
      spacingLg: _lerpDouble(spacingLg, other.spacingLg, t)!,
      spacingXl: _lerpDouble(spacingXl, other.spacingXl, t)!,
      spacing2Xl: _lerpDouble(spacing2Xl, other.spacing2Xl, t)!,
      radiusXs: _lerpDouble(radiusXs, other.radiusXs, t)!,
      radiusSm: _lerpDouble(radiusSm, other.radiusSm, t)!,
      radiusMd: _lerpDouble(radiusMd, other.radiusMd, t)!,
      radiusLg: _lerpDouble(radiusLg, other.radiusLg, t)!,
      radiusXl: _lerpDouble(radiusXl, other.radiusXl, t)!,
      radiusFull: _lerpDouble(radiusFull, other.radiusFull, t)!,
      elevationXs: _lerpDouble(elevationXs, other.elevationXs, t)!,
      elevationSm: _lerpDouble(elevationSm, other.elevationSm, t)!,
      elevationMd: _lerpDouble(elevationMd, other.elevationMd, t)!,
      elevationLg: _lerpDouble(elevationLg, other.elevationLg, t)!,
      elevationXl: _lerpDouble(elevationXl, other.elevationXl, t)!,
      fontSizeXs: _lerpDouble(fontSizeXs, other.fontSizeXs, t)!,
      fontSizeSm: _lerpDouble(fontSizeSm, other.fontSizeSm, t)!,
      fontSizeMd: _lerpDouble(fontSizeMd, other.fontSizeMd, t)!,
      fontSizeLg: _lerpDouble(fontSizeLg, other.fontSizeLg, t)!,
      fontSizeXl: _lerpDouble(fontSizeXl, other.fontSizeXl, t)!,
      fontSize2Xl: _lerpDouble(fontSize2Xl, other.fontSize2Xl, t)!,
      fontSize3Xl: _lerpDouble(fontSize3Xl, other.fontSize3Xl, t)!,
      fontSize4Xl: _lerpDouble(fontSize4Xl, other.fontSize4Xl, t)!,
    );
  }

  double? _lerpDouble(double? a, double? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;
    return a + (b - a) * t;
  }
}
