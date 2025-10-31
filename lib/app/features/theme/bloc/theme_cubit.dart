import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:test_project/core/config/constants/hive/hive_boxes.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final Box<int> box = Hive.box(HiveBoxConstants.theme.value);

  ThemeCubit() : super(const ThemeState(theme: AppTheme.light));

  /// Uygulama açıldığında temayı Hive’dan yükler
  void loadTheme() {
    final themeIndex =
        box.get(HiveBoxConstants.theme.value, defaultValue: 0) as int;
    emit(ThemeState(theme: AppTheme.values[themeIndex]));
  }

  /// Mevcut temayı değiştirir (Light ↔ Dark)
  void toggleTheme() {
    final newTheme = state.theme == AppTheme.light
        ? AppTheme.dark
        : AppTheme.light;
    box.put(HiveBoxConstants.theme.value, newTheme.index);
    emit(ThemeState(theme: newTheme));
  }

  /// Belirli bir temayı ayarlamak için (örnek: direkt dark yapmak)
  void setTheme(AppTheme theme) {
    box.put(HiveBoxConstants.theme.value, theme.index);
    emit(ThemeState(theme: theme));
  }
}
