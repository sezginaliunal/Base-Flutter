import 'package:flutter/material.dart';

enum AppFontStyles {
  sfProDisplay('SFProDisplay', 32); // Yeni font eklendi

  const AppFontStyles(this.fontName, this.size);
  final String fontName;
  final double size;
}

// Extension
extension AppFontStylesX on AppFontStyles {
  TextStyle get regular => TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: size,
  );
  TextStyle get italic => TextStyle(
    fontFamily: fontName,
    fontStyle: FontStyle.italic,
    fontSize: size,
  );
  TextStyle get bold => TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: size,
  );
}
