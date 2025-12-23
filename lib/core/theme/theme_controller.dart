import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'theme_state.dart';

class ThemeController extends GetxController {
  final Rx<ThemeState> _state = const ThemeState(
    theme: AppTheme.light,
    textScaleFactor: 1.0,
    isLoaded: false,
  ).obs;

  ThemeState get state => _state.value;
  AppTheme get theme => _state.value.theme;
  double get textScaleFactor => _state.value.textScaleFactor;
  bool get isLoaded => _state.value.isLoaded;

  @override
  void onInit() {
    super.onInit();
    loadTheme();
  }

  /// Hive'dan tema ve textScaleFactor'ı yükle
  Future<void> loadTheme() async {
    final box = await Hive.openBox('theme'); // dynamic box

    final themeIndex = box.get('themeIndex', defaultValue: 0) as int;
    final scale = box.get('textScaleFactor', defaultValue: 1.0) as double;

    _state.value = ThemeState(
      theme: AppTheme.values[themeIndex],
      textScaleFactor: scale,
      isLoaded: true,
    );
  }

  /// Tema değiştir (light <-> dark)
  Future<void> toggleTheme() async {
    final box = Hive.box('theme');
    final newTheme = theme == AppTheme.light ? AppTheme.dark : AppTheme.light;

    await box.put('themeIndex', newTheme.index);
    _state.value = state.copyWith(theme: newTheme);
  }

  /// Belirli temayı ayarla
  Future<void> setTheme(AppTheme theme) async {
    final box = Hive.box('theme');
    await box.put('themeIndex', theme.index);
    _state.value = state.copyWith(theme: theme);
  }

  /// Yazı boyutunu ayarla
  Future<void> setTextScaleFactor(double scale) async {
    final box = Hive.box('theme');
    await box.put('textScaleFactor', scale);
    _state.value = state.copyWith(textScaleFactor: scale);
  }
}
