import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension IntExtensions on int? {
  String toStr() => (this ?? 0).toString();

  String toCurrencyString({String locale = 'en_US', String symbol = '\$'}) {
    final value = this ?? 0;
    final format = NumberFormat.currency(
      locale: locale,
      symbol: symbol,
      decimalDigits: 0,
    );
    return format.format(value);
  }

  String toPercentString() {
    final value = (this ?? 0) * 100;
    return '$value%';
  }

  String toPaddedString(int length, {String padChar = '0'}) {
    return (this ?? 0).toString().padLeft(length, padChar);
  }

  // =================== Null / 0 Kontrol ===================
  bool get isNullOrZero => this == null || this == 0;
  bool get isNotNullOrZero => !isNullOrZero;

  // =================== Matematiksel İşlemler ===================
  int clampValue(int min, int max) {
    if (this == null) return min;
    return this!.clamp(min, max);
  }

  int absValue() => this?.abs() ?? 0;

  bool get isPositive => (this ?? 0) > 0;
  bool get isNegative => (this ?? 0) < 0;

  // =================== Dönüştürmeler ===================
  double toDoubleSafe({double defaultValue = 0.0}) =>
      this?.toDouble() ?? defaultValue;
  String toCurrency({String locale = 'en_US', String symbol = '\$'}) {
    final value = this ?? 0;
    final format = NumberFormat.currency(
      locale: locale,
      symbol: symbol,
      decimalDigits: 0,
    );
    return format.format(value);
  }

  String toPercent() {
    final value = (this ?? 0) * 100;
    return '$value%';
  }

  // =================== Matematiksel Yardımcı ===================
  int add(int value) => (this ?? 0) + value;
  int subtract(int value) => (this ?? 0) - value;
  int multiply(int value) => (this ?? 0) * value;
  double divide(int value) => (this ?? 0) / (value != 0 ? value : 1);

  // =================== Boolean Kontrol ===================
  bool greaterThan(int value) => (this ?? 0) > value;
  bool lessThan(int value) => (this ?? 0) < value;
  bool equalTo(int value) => (this ?? 0) == value;

  // =================== Animasyon / UI Helper ===================
  /// SizedBox için kısayol
  SizedBox get height => SizedBox(height: (this ?? 0).toDouble());
  SizedBox get width => SizedBox(width: (this ?? 0).toDouble());
}
