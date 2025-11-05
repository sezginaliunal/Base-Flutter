import 'package:flutter/material.dart';

/// Uygulama genelinde context erişimi ve navigator işlemleri için singleton yapı
class AppKeys {
  static final AppKeys _instance = AppKeys._internal();

  factory AppKeys() => _instance;

  AppKeys._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext? get context => navigatorKey.currentContext;
}
