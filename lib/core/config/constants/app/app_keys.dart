import 'package:flutter/material.dart';

/// Tüm context gerektiren işlemler için global key
class AppKeys {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext? get context => navigatorKey.currentContext;
}
