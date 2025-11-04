import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'theme_state.dart';
import 'package:test_project/core/config/constants/hive/hive_boxes.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
    : super(const ThemeState(theme: AppTheme.light, isLoaded: false));

  /// Hive'dan temayı yükleme
  Future<void> loadTheme() async {
    final box = await Hive.openBox<int>(HiveBoxConstants.theme.value);
    final themeIndex =
        box.get(HiveBoxConstants.theme.value, defaultValue: 0) as int;

    emit(ThemeState(theme: AppTheme.values[themeIndex], isLoaded: true));
  }

  /// Temayı değiştir
  Future<void> toggleTheme() async {
    final box = Hive.box<int>(HiveBoxConstants.theme.value);
    final newTheme = state.theme == AppTheme.light
        ? AppTheme.dark
        : AppTheme.light;

    await box.put(HiveBoxConstants.theme.value, newTheme.index);
    emit(state.copyWith(theme: newTheme));
  }

  /// Belirli temayı ayarla
  Future<void> setTheme(AppTheme theme) async {
    final box = Hive.box<int>(HiveBoxConstants.theme.value);
    await box.put(HiveBoxConstants.theme.value, theme.index);
    emit(state.copyWith(theme: theme));
  }
}
