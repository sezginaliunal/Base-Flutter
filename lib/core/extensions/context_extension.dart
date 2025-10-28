import 'package:flutter/material.dart';

extension MyContextThemeExtension on BuildContext {
  // 🟦 MediaQuery kısayolları
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => mediaQuery.size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  double dynamicWidth(double value) => screenWidth * value;
  double dynamicHeight(double value) => screenHeight * value;

  bool get isSmallPhone => screenWidth < 360;
  bool get isLargeTablet => screenWidth >= 900;
  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;

  // 🟩 Responsive kontroller
  bool get isPhone => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1100;
  bool get isDesktop => screenWidth >= 1100;

  // 🟨 Klavye durumu
  bool get isKeyboardOpen => mediaQuery.viewInsets.bottom > 0;
  bool get isKeyboardClosed => !isKeyboardOpen;

  // 🟦 Radius’lar (Hem BorderRadius hem Radius)
  double get lowRadiusValue => 8;
  double get normalRadiusValue => 16;
  double get highRadiusValue => 24;

  Radius get lowRadius => Radius.circular(lowRadiusValue);
  Radius get normalRadius => Radius.circular(normalRadiusValue);
  Radius get highRadius => Radius.circular(highRadiusValue);

  BorderRadius get lowBorderRadius => BorderRadius.circular(lowRadiusValue);
  BorderRadius get normalBorderRadius =>
      BorderRadius.circular(normalRadiusValue);
  BorderRadius get highBorderRadius => BorderRadius.circular(highRadiusValue);

  // 🟩 Theme kısayolları
  ThemeData get theme => Theme.of(this);
  TextTheme get textStyles => theme.textTheme; // ✅ değiştirildi
  ColorScheme get colorScheme => theme.colorScheme;
}
