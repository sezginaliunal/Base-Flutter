import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/core/config/constants/colors/dark_colors.dart';
import 'package:test_project/core/config/constants/colors/light_colors.dart';

class AppThemes {
  /// Light Theme
  static ThemeData get light => ThemeData(
    // fontFamily: AppFontStyles.sfProDisplay.fontName,
    useMaterial3: true,
    brightness: Brightness.light,
    // fontFamily: AppFontStyles.sfProDisplay.fontName, // Uncomment when needed

    // === COLOR SCHEME ===
    colorScheme: ColorScheme.light(
      primary: LightColors.primary,
      onPrimary: LightColors.onPrimary,
      primaryContainer: LightColors.primaryContainer,
      onPrimaryContainer: LightColors.onPrimaryContainer,
      secondary: LightColors.secondary,
      onSecondary: LightColors.onSecondary,
      secondaryContainer: LightColors.secondaryContainer,
      onSecondaryContainer: LightColors.onSecondaryContainer,
      tertiary: LightColors.tertiary,
      onTertiary: LightColors.onTertiary,
      tertiaryContainer: LightColors.tertiaryContainer,
      onTertiaryContainer: LightColors.onTertiaryContainer,
      error: LightColors.error,
      onError: LightColors.onError,
      errorContainer: LightColors.errorContainer,
      onErrorContainer: LightColors.onErrorContainer,
      surface: LightColors.surface,
      onSurface: LightColors.onSurface,
      surfaceContainerHighest: LightColors.surfaceVariant,
      onSurfaceVariant: LightColors.onSurfaceVariant,
      outline: LightColors.outline,
      outlineVariant: LightColors.outlineVariant,
      shadow: LightColors.shadow,
      scrim: LightColors.scrim,
    ),

    // === SCAFFOLD ===
    scaffoldBackgroundColor: LightColors.background,

    // === APP BAR ===
    appBarTheme: AppBarTheme(
      backgroundColor: LightColors.appBarBackground,
      foregroundColor: LightColors.appBarForeground,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: LightColors.appBarForeground,
      ),
      iconTheme: const IconThemeData(color: LightColors.iconPrimary),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
    ),

    // === ELEVATED BUTTON ===
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: LightColors.buttonPrimary,
        foregroundColor: LightColors.onPrimary,
        disabledBackgroundColor: LightColors.buttonDisabled,
        disabledForegroundColor: LightColors.onButtonDisabled,
        elevation: 5,
        shadowColor: LightColors.buttonPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    // === TEXT BUTTON ===
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: LightColors.primary,
        disabledForegroundColor: LightColors.onButtonDisabled,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    // === OUTLINED BUTTON ===
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: LightColors.primary,
        disabledForegroundColor: LightColors.onButtonDisabled,
        side: const BorderSide(color: LightColors.primary, width: 1.5),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    // === FILLED BUTTON ===
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: LightColors.primary,
        foregroundColor: LightColors.onPrimary,
        disabledBackgroundColor: LightColors.buttonDisabled,
        disabledForegroundColor: LightColors.onButtonDisabled,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    // === ICON BUTTON ===
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: LightColors.iconPrimary,
        disabledForegroundColor: LightColors.iconDisabled,
      ),
    ),

    // === CARD ===
    cardTheme: CardThemeData(
      color: LightColors.cardBackground,
      shadowColor: LightColors.cardShadow,
      elevation: 2,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: LightColors.cardBorder, width: 1),
      ),
    ),

    // === CHIP ===
    chipTheme: ChipThemeData(
      backgroundColor: LightColors.chipBackground,
      deleteIconColor: LightColors.iconSecondary,
      disabledColor: LightColors.disabled,
      selectedColor: LightColors.primary,
      secondarySelectedColor: LightColors.primaryContainer,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      labelStyle: const TextStyle(
        color: LightColors.chipForeground,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      secondaryLabelStyle: const TextStyle(color: LightColors.onPrimary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: LightColors.chipBorder),
      ),
    ),

    // === INPUT DECORATION ===
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: LightColors.textFieldBackground,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

      // Borders
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: LightColors.textFieldBorder,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: LightColors.textFieldBorder,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: LightColors.textFieldBorderFocused,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: LightColors.textFieldBorderError,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: LightColors.textFieldBorderError,
          width: 2,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: LightColors.disabled, width: 1),
      ),

      // Text styles
      labelStyle: const TextStyle(
        color: LightColors.textFieldLabel,
        fontSize: 16,
      ),
      floatingLabelStyle: const TextStyle(
        color: LightColors.primary,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      hintStyle: const TextStyle(
        color: LightColors.textFieldHint,
        fontSize: 16,
      ),
      errorStyle: const TextStyle(color: LightColors.error, fontSize: 12),

      // Icons
      prefixIconColor: LightColors.iconSecondary,
      suffixIconColor: LightColors.iconSecondary,
    ),

    // === BOTTOM NAVIGATION BAR ===
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: LightColors.bottomNavBackground,
      selectedItemColor: LightColors.bottomNavSelected,
      unselectedItemColor: LightColors.bottomNavUnselected,
      selectedIconTheme: IconThemeData(size: 28),
      unselectedIconTheme: IconThemeData(size: 24),
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    // === NAVIGATION BAR (Material 3) ===
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: LightColors.bottomNavBackground,
      indicatorColor: LightColors.primaryContainer,
      height: 80,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: LightColors.primary,
          );
        }
        return const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: LightColors.bottomNavUnselected,
        );
      }),
    ),

    // === DIVIDER ===
    dividerTheme: const DividerThemeData(
      color: LightColors.divider,
      thickness: 1,
      space: 1,
    ),

    // === DIALOG ===
    dialogTheme: DialogThemeData(
      backgroundColor: LightColors.surface,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titleTextStyle: const TextStyle(
        color: LightColors.onSurface,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      contentTextStyle: const TextStyle(
        color: LightColors.onSurfaceVariant,
        fontSize: 16,
      ),
    ),

    // === FLOATING ACTION BUTTON ===
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: LightColors.primary,
      foregroundColor: LightColors.onPrimary,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),

    // === LIST TILE ===
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      iconColor: LightColors.iconPrimary,
    ),

    // === SWITCH ===
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return LightColors.primary;
        }
        return LightColors.outline;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return LightColors.primaryContainer;
        }
        return LightColors.surfaceVariant;
      }),
    ),

    // === RADIO ===
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return LightColors.primary;
        }
        return LightColors.outline;
      }),
    ),

    // === CHECKBOX ===
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return LightColors.primary;
        }
        return LightColors.outline;
      }),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),

    // === PROGRESS INDICATOR ===
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: LightColors.primary,
      linearTrackColor: LightColors.primaryContainer,
      circularTrackColor: LightColors.primaryContainer,
    ),
  );

  /// Dark Theme
  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    // fontFamily: AppFontStyles.sfProDisplay.fontName,

    // === COLOR SCHEME ===
    colorScheme: ColorScheme.dark(
      primary: DarkColors.primary,
      onPrimary: DarkColors.onPrimary,
      primaryContainer: DarkColors.primaryContainer,
      onPrimaryContainer: DarkColors.onPrimaryContainer,
      secondary: DarkColors.secondary,
      onSecondary: DarkColors.onSecondary,
      secondaryContainer: DarkColors.secondaryContainer,
      onSecondaryContainer: DarkColors.onSecondaryContainer,
      tertiary: DarkColors.tertiary,
      onTertiary: DarkColors.onTertiary,
      tertiaryContainer: DarkColors.tertiaryContainer,
      onTertiaryContainer: DarkColors.onTertiaryContainer,
      error: DarkColors.error,
      onError: DarkColors.onError,
      errorContainer: DarkColors.errorContainer,
      onErrorContainer: DarkColors.onErrorContainer,
      surface: DarkColors.surface,
      onSurface: DarkColors.onSurface,
      surfaceContainerHighest: DarkColors.surfaceVariant,
      onSurfaceVariant: DarkColors.onSurfaceVariant,
      outline: DarkColors.outline,
      outlineVariant: DarkColors.outlineVariant,
      shadow: DarkColors.shadow,
      scrim: DarkColors.scrim,
    ),

    // === SCAFFOLD ===
    scaffoldBackgroundColor: DarkColors.background,

    // === APP BAR ===
    appBarTheme: AppBarTheme(
      backgroundColor: DarkColors.buttonPrimary,
      foregroundColor: DarkColors.appBarForeground,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: DarkColors.appBarForeground,
      ),
      iconTheme: const IconThemeData(color: DarkColors.iconPrimary),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
    ),

    // === ELEVATED BUTTON ===
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DarkColors.buttonPrimary,
        foregroundColor: DarkColors.onPrimary,
        disabledBackgroundColor: DarkColors.buttonDisabled,
        disabledForegroundColor: DarkColors.onButtonDisabled,
        elevation: 5,
        shadowColor: DarkColors.buttonPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    // === TEXT BUTTON ===
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: DarkColors.primary,
        disabledForegroundColor: DarkColors.onButtonDisabled,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    // === OUTLINED BUTTON ===
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: DarkColors.primary,
        disabledForegroundColor: DarkColors.onButtonDisabled,
        side: const BorderSide(color: DarkColors.primary, width: 1.5),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    // === FILLED BUTTON === //Error buton
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: DarkColors.primary,
        foregroundColor: DarkColors.onPrimary,
        disabledBackgroundColor: DarkColors.buttonDisabled,
        disabledForegroundColor: DarkColors.onButtonDisabled,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    // === ICON BUTTON ===
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: DarkColors.iconPrimary,
        disabledForegroundColor: DarkColors.iconDisabled,
      ),
    ),

    // === CARD ===
    cardTheme: CardThemeData(
      color: DarkColors.cardBackground,
      shadowColor: DarkColors.cardShadow,
      elevation: 3,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: DarkColors.cardBorder, width: 1),
      ),
    ),

    // === CHIP ===
    chipTheme: ChipThemeData(
      backgroundColor: DarkColors.chipBackground,
      deleteIconColor: DarkColors.iconSecondary,
      disabledColor: DarkColors.disabled,
      selectedColor: DarkColors.primary,
      secondarySelectedColor: DarkColors.primaryContainer,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      labelStyle: const TextStyle(
        color: DarkColors.chipForeground,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      secondaryLabelStyle: const TextStyle(color: DarkColors.onPrimary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: DarkColors.chipBorder),
      ),
    ),

    // === INPUT DECORATION ===
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: DarkColors.textFieldBackground,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

      // Borders
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: DarkColors.textFieldBorder,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: DarkColors.textFieldBorder,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: DarkColors.textFieldBorderFocused,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: DarkColors.textFieldBorderError,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: DarkColors.textFieldBorderError,
          width: 2,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: DarkColors.disabled, width: 1),
      ),

      // Text styles
      labelStyle: const TextStyle(
        color: DarkColors.textFieldLabel,
        fontSize: 16,
      ),
      floatingLabelStyle: const TextStyle(
        color: DarkColors.primary,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      hintStyle: const TextStyle(color: DarkColors.textFieldHint, fontSize: 16),
      errorStyle: const TextStyle(color: DarkColors.error, fontSize: 12),

      // Icons
      prefixIconColor: DarkColors.iconSecondary,
      suffixIconColor: DarkColors.iconSecondary,
    ),

    // === BOTTOM NAVIGATION BAR ===
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: DarkColors.bottomNavBackground,
      selectedItemColor: DarkColors.bottomNavSelected,
      unselectedItemColor: DarkColors.bottomNavUnselected,
      selectedIconTheme: IconThemeData(size: 28),
      unselectedIconTheme: IconThemeData(size: 24),
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    // === NAVIGATION BAR (Material 3) ===
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: DarkColors.bottomNavBackground,
      indicatorColor: DarkColors.primaryContainer,
      height: 80,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: DarkColors.primary,
          );
        }
        return const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: DarkColors.bottomNavUnselected,
        );
      }),
    ),

    // === DIVIDER ===
    dividerTheme: const DividerThemeData(
      color: DarkColors.divider,
      thickness: 1,
      space: 1,
    ),

    // === DIALOG ===
    dialogTheme: DialogThemeData(
      backgroundColor: DarkColors.surface,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titleTextStyle: const TextStyle(
        color: DarkColors.onSurface,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      contentTextStyle: const TextStyle(
        color: DarkColors.onSurfaceVariant,
        fontSize: 16,
      ),
    ),

    // === FLOATING ACTION BUTTON ===
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: DarkColors.primary,
      foregroundColor: DarkColors.onPrimary,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),

    // === LIST TILE ===
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      iconColor: DarkColors.iconPrimary,
    ),

    // === SWITCH ===
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return DarkColors.primary;
        }
        return DarkColors.outline;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return DarkColors.primaryContainer;
        }
        return DarkColors.surfaceVariant;
      }),
    ),

    // === RADIO ===
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return DarkColors.primary;
        }
        return DarkColors.outline;
      }),
    ),

    // === CHECKBOX ===
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return DarkColors.primary;
        }
        return DarkColors.outline;
      }),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),

    // === PROGRESS INDICATOR ===
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: DarkColors.primary,
      linearTrackColor: DarkColors.primaryContainer,
      circularTrackColor: DarkColors.primaryContainer,
    ),
  );

  AppThemes._(); // Private constructor to prevent instantiation
}
