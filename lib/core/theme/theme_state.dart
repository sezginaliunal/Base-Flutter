part of 'theme_cubit.dart';

/// Theme state class
class ThemeState {
  final ThemeMode themeMode;

  const ThemeState({this.themeMode = ThemeMode.system});

  ThemeState copyWith({ThemeMode? themeMode}) {
    return ThemeState(themeMode: themeMode ?? this.themeMode);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeState &&
          runtimeType == other.runtimeType &&
          themeMode == other.themeMode;

  @override
  int get hashCode => themeMode.hashCode;

  @override
  String toString() => 'ThemeState(themeMode: $themeMode)';
}
