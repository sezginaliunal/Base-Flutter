import 'package:flutter/material.dart';
import 'package:test_project/core/theme/app_theme.dart';

enum AppTheme { light, dark }

class ThemeState {
  final AppTheme theme;
  final double textScaleFactor;
  final bool isLoaded;

  const ThemeState({
    required this.theme,
    this.textScaleFactor = 1.0,
    this.isLoaded = false,
  });

  ThemeData get themeData =>
      theme == AppTheme.light ? AppThemes.light : AppThemes.dark;

  ThemeState copyWith({
    AppTheme? theme,
    double? textScaleFactor,
    bool? isLoaded,
  }) {
    return ThemeState(
      theme: theme ?? this.theme,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}
