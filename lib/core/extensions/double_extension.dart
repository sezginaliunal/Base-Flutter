import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DoubleExtensions on double? {
  // =================== String Çevirme ===================
  String toStr({int fractionDigits = 2}) {
    if (this == null) return '0';
    return this!.toStringAsFixed(fractionDigits);
  }

  String toCurrencyString({
    String locale = 'en_US',
    String symbol = '\$',
    int fractionDigits = 2,
  }) {
    final value = this ?? 0.0;
    final format = NumberFormat.currency(
      locale: locale,
      symbol: symbol,
      decimalDigits: fractionDigits,
    );
    return format.format(value);
  }

  String toPercentString({int fractionDigits = 2}) {
    final value = (this ?? 0.0) * 100;
    return '${value.toStringAsFixed(fractionDigits)}%';
  }

  String toPaddedString(int length, {String padChar = '0'}) {
    final val = this?.toInt() ?? 0;
    return val.toString().padLeft(length, padChar);
  }

  // =================== Null / 0 Kontrol ===================
  bool get isNullOrZero => this == null || this == 0;
  bool get isNotNullOrZero => !isNullOrZero;

  // =================== Matematiksel İşlemler ===================
  double toPrecision(int fractionDigits) {
    if (this == null) return 0.0;
    return double.parse(this!.toStringAsFixed(fractionDigits));
  }

  double clampValue(double min, double max) {
    if (this == null) return min;
    return this!.clamp(min, max);
  }

  double absValue() => this?.abs() ?? 0.0;

  bool get isPositive => (this ?? 0.0) > 0;
  bool get isNegative => (this ?? 0.0) < 0;

  // =================== Dönüştürmeler ===================
  int toIntSafe({int defaultValue = 0}) => this?.toInt() ?? defaultValue;
  String toCurrency({String locale = 'en_US', String symbol = '\$'}) {
    final value = this ?? 0.0;
    final format = NumberFormat.currency(locale: locale, symbol: symbol);
    return format.format(value);
  }

  String toPercent({int fractionDigits = 2}) {
    final value = (this ?? 0.0) * 100;
    return '${value.toStringAsFixed(fractionDigits)}%';
  }

  // =================== Matematiksel Yardımcı ===================
  double add(double value) => (this ?? 0.0) + value;
  double subtract(double value) => (this ?? 0.0) - value;
  double multiply(double value) => (this ?? 0.0) * value;
  double divide(double value) => (this ?? 0.0) / (value != 0 ? value : 1);

  // =================== Boolean Kontrol ===================
  bool greaterThan(double value) => (this ?? 0.0) > value;
  bool lessThan(double value) => (this ?? 0.0) < value;
  bool equalTo(double value) => (this ?? 0.0) == value;

  // =================== Animasyon / UI Helper ===================
  /// SizedBox için kısayol
  SizedBox get height => SizedBox(height: this ?? 0.0);
  SizedBox get width => SizedBox(width: this ?? 0.0);
}
