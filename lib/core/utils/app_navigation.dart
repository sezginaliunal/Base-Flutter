import 'package:flutter/material.dart';
import 'package:test_project/core/config/constants/app/app_keys.dart';
import 'package:test_project/core/config/constants/routes/navigation_routes.dart';

class AppNav {
  /// Kısayol: global navigatorState
  static NavigatorState? get _nav => AppKeys().navigatorKey.currentState;

  /// Kısayol: global context
  static BuildContext? get context => AppKeys().context;

  // =================== PUSH ===================
  static Future<T?>? push<T>(Widget page) {
    return _nav?.push(MaterialPageRoute(builder: (_) => page));
  }

  static Future<T?>? pushNamed<T>(String routeName, {Object? arguments}) {
    return _nav?.pushNamed<T>(routeName, arguments: arguments);
  }

  // =================== REPLACE ===================
  static Future<T?>? replace<T>(Widget page) {
    return _nav?.pushReplacement(MaterialPageRoute(builder: (_) => page));
  }

  static Future<T?>? replaceNamed<T>(String routeName, {Object? arguments}) {
    return _nav?.pushReplacementNamed(routeName, arguments: arguments);
  }

  // =================== OFF ALL ===================
  static Future<T?>? offAll<T>(Widget page) {
    return _nav?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  static Future<T?>? offAllNamed<T>(String routeName, {Object? arguments}) {
    return _nav?.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  // =================== POP ===================
  static void pop<T extends Object?>([T? result]) {
    if (_nav?.canPop() ?? false) _nav?.pop(result);
  }

  // =================== BACK TO SPECIFIC ROUTE ===================
  static void backTo(String routeName) {
    _nav?.popUntil((route) => route.settings.name == routeName);
  }

  // =================== IS CURRENT ROUTE ===================
  static bool isCurrent(String routeName) {
    final ctx = context;
    if (ctx == null) return false;
    ModalRoute<dynamic>? route = ModalRoute.of(ctx);
    return route?.settings.name == routeName;
  }

  // =================== MAYBE POP ===================
  static Future<bool> maybePop<T extends Object?>([T? result]) async {
    return _nav?.maybePop(result) ?? Future.value(false);
  }

  // =================== CLEAR STACK & GO TO HOME ===================
  static void toHome() {
    offAllNamed(RoutesName.home.path);
  }

  // =================== GO BACK OR DEFAULT ===================
  static void backOr(String routeName) {
    if (_nav?.canPop() ?? false) {
      pop();
    } else {
      offAllNamed(routeName);
    }
  }

  // =================== DEBUG LOG ===================
  static void logRouteChange(String routeName) {
    debugPrint("🧭 Navigated to: $routeName");
  }
}
