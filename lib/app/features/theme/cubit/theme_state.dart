import 'package:flutter/material.dart';
import 'package:test_project/app/features/theme/app_theme.dart';

enum AppTheme { light, dark }

class ThemeState {
  final AppTheme theme;
  final bool isLoaded;

  const ThemeState({required this.theme, this.isLoaded = false});

  ThemeData get themeData =>
      theme == AppTheme.light ? AppThemes.light : AppThemes.dark;

  bool get isDark => theme == AppThemes.dark;

  ThemeState copyWith({AppTheme? theme, bool? isLoaded}) {
    return ThemeState(
      theme: theme ?? this.theme,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}
