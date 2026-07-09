import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../constants/app_constants.dart';

part 'theme_state.dart';

/// Cubit for managing app theme (Light/Dark mode)
class ThemeCubit extends Cubit<ThemeState> {
  final Box _box;

  ThemeCubit(this._box) : super(const ThemeState());

  /// Load saved theme from Hive
  Future<void> loadTheme() async {
    try {
      final savedTheme = _box.get(AppConstants.themeKey) as String?;
      if (savedTheme != null) {
        emit(
          ThemeState(
            themeMode: ThemeMode.values.firstWhere(
              (mode) => mode.name == savedTheme,
              orElse: () => ThemeMode.system,
            ),
          ),
        );
      }
    } catch (e) {
      // If error, keep default system theme
      emit(const ThemeState());
    }
  }

  /// Change theme mode
  Future<void> changeTheme(ThemeMode themeMode) async {
    try {
      await _box.put(AppConstants.themeKey, themeMode.name);
      emit(ThemeState(themeMode: themeMode));
    } catch (e) {
      // Even if storage fails, update UI state
      emit(ThemeState(themeMode: themeMode));
    }
  }

  /// Toggle between light and dark
  Future<void> toggleTheme() async {
    final newTheme = state.themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    await changeTheme(newTheme);
  }

  /// Set to light theme
  Future<void> setLightTheme() async {
    await changeTheme(ThemeMode.light);
  }

  /// Set to dark theme
  Future<void> setDarkTheme() async {
    await changeTheme(ThemeMode.dark);
  }

  /// Set to system theme
  Future<void> setSystemTheme() async {
    await changeTheme(ThemeMode.system);
  }
}
