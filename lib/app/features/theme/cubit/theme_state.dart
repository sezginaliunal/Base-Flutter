import 'package:flutter/material.dart';

enum AppTheme { light, dark }

class ThemeState {
  final AppTheme theme;
  final bool isLoaded;

  const ThemeState({required this.theme, this.isLoaded = false});

  ThemeData get themeData =>
      theme == AppTheme.light ? ThemeData.light() : ThemeData.dark();

  bool get isDark => theme == AppTheme.dark;

  ThemeState copyWith({AppTheme? theme, bool? isLoaded}) {
    return ThemeState(
      theme: theme ?? this.theme,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}
