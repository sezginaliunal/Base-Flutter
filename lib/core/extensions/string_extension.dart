import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Tarih formatlama için

extension StringExtensions on String? {
  // =================== Null / Boş Kontroller ===================
  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;
  bool get isNotNullOrEmpty => !isNullOrEmpty;

  // =================== Sayı Kontrolleri ===================
  bool get isNumeric => this != null && double.tryParse(this!.trim()) != null;
  bool get isInt => this != null && int.tryParse(this!.trim()) != null;
  // =================== Sayısal ===================
  int toIntSafe({int defaultValue = 0}) {
    if (this == null) return defaultValue;
    return int.tryParse(this!.trim()) ?? defaultValue;
  }

  double toDoubleSafe({double defaultValue = 0.0}) {
    if (this == null) return defaultValue;
    return double.tryParse(this!.trim()) ?? defaultValue;
  }

  bool toBoolSafe({bool defaultValue = false}) {
    if (this == null) return defaultValue;
    final val = this!.trim().toLowerCase();
    if (val == 'true' || val == '1') return true;
    if (val == 'false' || val == '0') return false;
    return defaultValue;
  }

  // =================== Tarih ===================
  /// String'i DateTime olarak parse eder. pattern belirtilmezse ISO8601 kabul edilir
  DateTime? toDateTimeSafe({String? pattern, DateTime? defaultValue}) {
    if (this == null || this!.isEmpty) return defaultValue;
    try {
      if (pattern != null) {
        return DateFormat(pattern).parse(this!.trim());
      } else {
        return DateTime.tryParse(this!.trim()) ?? defaultValue;
      }
    } catch (_) {
      return defaultValue;
    }
  }

  // =================== Format / Regex Kontrolleri ===================
  bool get isEmail {
    if (this == null) return false;
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(this!.trim());
  }

  bool get isPhoneNumber {
    if (this == null) return false;
    final phoneRegex = RegExp(r'^\+?\d{7,15}$');
    return phoneRegex.hasMatch(this!.trim());
  }

  bool containsIgnoreCase(String value) {
    if (this == null) return false;
    return this!.toLowerCase().contains(value.toLowerCase());
  }

  bool startsWithIgnoreCase(String value) {
    if (this == null) return false;
    return this!.toLowerCase().startsWith(value.toLowerCase());
  }

  bool endsWithIgnoreCase(String value) {
    if (this == null) return false;
    return this!.toLowerCase().endsWith(value.toLowerCase());
  }

  // =================== Dönüştürmeler ===================
  int toIntOrZero() => int.tryParse(this?.trim() ?? '') ?? 0;
  double toDoubleOrZero() => double.tryParse(this?.trim() ?? '') ?? 0.0;
  bool toBool({bool caseSensitive = false}) {
    if (this == null) return false;
    final val = this!.trim();
    if (caseSensitive) return val == 'true';
    return val.toLowerCase() == 'true';
  }

  String capitalize() {
    if (this == null || this!.isEmpty) return '';
    return this![0].toUpperCase() + this!.substring(1);
  }

  String titleCase() {
    if (this == null || this!.isEmpty) return '';
    return this!
        .split(' ')
        .map(
          (word) =>
              word.isEmpty ? '' : word[0].toUpperCase() + word.substring(1),
        )
        .join(' ');
  }

  String toUpperCaseFirstLetter() => capitalize();
  String toLowerCaseFirstLetter() {
    if (this == null || this!.isEmpty) return '';
    return this![0].toLowerCase() + this!.substring(1);
  }

  String trimAll() => this?.trim() ?? '';
  String removeSpaces() => this?.replaceAll(' ', '') ?? '';
  String repeat(int times) => List.filled(times, this ?? '').join();
  String padLeftWith(String char, int length) =>
      (this ?? '').padLeft(length, char);
  String padRightWith(String char, int length) =>
      (this ?? '').padRight(length, char);

  /// İki substring arasındaki kısmı döndürür
  String? between(String start, String end) {
    if (this == null) return null;
    final s = this!;
    final startIndex = s.indexOf(start);
    if (startIndex == -1) return null;
    final endIndex = s.indexOf(end, startIndex + start.length);
    if (endIndex == -1) return null;
    return s.substring(startIndex + start.length, endIndex);
  }

  /// Sadece harf ve rakam bırakır
  String removeSpecialChars() {
    if (this == null) return '';
    return this!.replaceAll(RegExp(r'[^A-Za-z0-9]'), '');
  }

  /// Sadece rakam bırakır
  String onlyNumbers() {
    if (this == null) return '';
    return this!.replaceAll(RegExp(r'[^0-9]'), '');
  }

  /// Sadece harf bırakır
  String onlyLetters() {
    if (this == null) return '';
    return this!.replaceAll(RegExp(r'[^A-Za-z]'), '');
  }

  /// Çoklu boşlukları tek boşluk yapar
  String normalizeSpaces() {
    if (this == null) return '';
    return this!.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  String toSnakeCase() =>
      this
          ?.replaceAllMapped(RegExp(r'[A-Z]'), (m) => '_${m[0]!.toLowerCase()}')
          .replaceAll(' ', '_')
          .replaceAll(RegExp(r'__+'), '_')
          .trim()
          .replaceAll(RegExp(r'^_|_$'), '') ??
      '';

  String toCamelCase() {
    if (this == null || this!.isEmpty) return '';
    final words = this!.split(RegExp(r'[_\s]+'));
    return words.first.toLowerCase() +
        words.skip(1).map((w) => w.capitalize()).join();
  }

  String toKebabCase() => this?.trim().replaceAll(' ', '-').toLowerCase() ?? '';

  // =================== Manipülasyon ===================
  String substringSafe(int start, [int? end]) {
    if (this == null || this!.isEmpty) return '';
    final s = this!;
    final safeStart = start.clamp(0, s.length);
    final safeEnd = end != null ? end.clamp(0, s.length) : s.length;
    if (safeStart >= safeEnd) return '';
    return s.substring(safeStart, safeEnd);
  }

  String replaceAllIgnoreCase(String from, String to) {
    if (this == null || this!.isEmpty) return '';
    return this!.replaceAll(
      RegExp(RegExp.escape(from), caseSensitive: false),
      to,
    );
  }

  String truncate(int length, {String omission = '...'}) {
    if (this == null || this!.length <= length) return this ?? '';
    return this!.substring(0, length) + omission;
  }

  // =================== UI Helpers ===================
  Text toText({
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) => Text(
    this ?? '',
    style: style,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  RichText toRichText({TextStyle? style, List<InlineSpan>? children}) =>
      RichText(
        text: TextSpan(
          text: this ?? '',
          style: style ?? const TextStyle(color: Colors.black),
          children: children,
        ),
      );

  Text toLabel({
    double fontSize = 14,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
  }) => Text(
    this ?? '',
    style: TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
  );
}
