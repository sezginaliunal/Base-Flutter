import 'package:flutter/material.dart';

enum AppTheme { light, dark }

class ThemeState {
  final AppTheme theme;

  const ThemeState({required this.theme});

  ThemeData get themeData {
    switch (theme) {
      case AppTheme.dark:
        return ThemeData.dark();
      case AppTheme.light:
        return ThemeData.light();
    }
  }

  bool get isDark => theme == AppTheme.dark;
}
