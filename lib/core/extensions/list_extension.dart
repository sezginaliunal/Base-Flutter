import 'package:flutter/material.dart';

extension ListExtensions<T> on List<T>? {
  // =================== Null / Empty Kontroller ===================
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNotNullOrEmpty => !isNullOrEmpty;

  int get lengthOrZero => this?.length ?? 0;

  // =================== Manipülasyon ===================
  List<T> get safe => this ?? [];

  List<T> reversedSafe() => this?.reversed.toList() ?? [];

  T? firstOrNull() => this?.isNotEmpty == true ? this!.first : null;
  T? lastOrNull() => this?.isNotEmpty == true ? this!.last : null;

  List<T> takeSafe(int n) => this != null ? this!.take(n).toList() : [];
  List<T> skipSafe(int n) => this != null ? this!.skip(n).toList() : [];

  List<T> whereNotNull() {
    if (this == null) return [];
    if (T == Null) return []; // ekstra güvenlik
    return this!.where((e) => e != null).cast<T>().toList();
  }

  List<T> distinct() => this != null ? this!.toSet().toList() : [];

  // =================== Index / Element ===================
  T? elementAtSafe(int index) {
    if (this == null) return null;
    if (index < 0 || index >= this!.length) return null;
    return this![index];
  }

  // =================== UI Helper ===================
  List<Widget> toTextWidgets({TextStyle? style}) {
    if (this == null) return [];
    return this!.map((e) => Text(e.toString(), style: style)).toList();
  }

  List<Widget> toLabelWidgets({
    double fontSize = 14,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    if (this == null) return [];
    return this!
        .map(
          (e) => Text(
            e.toString(),
            style: TextStyle(
              fontSize: fontSize,
              color: color,
              fontWeight: fontWeight,
            ),
          ),
        )
        .toList();
  }
}
