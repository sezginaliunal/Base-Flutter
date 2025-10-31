// lib/core/routes/route_generator.dart
import 'package:flutter/material.dart';
import 'package:test_project/app/features/init/view/init_view.dart';
import 'package:test_project/core/components/unknown_view.dart';
import 'package:test_project/core/config/constants/routes/navigation_routes.dart';

class AppRouter {
  // 🔹 Singleton instance
  AppRouter._privateConstructor();
  static final AppRouter instance = AppRouter._privateConstructor();

  // 🔹 Route üreten ana method
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.init:
        return _page(const InitPage(), settings);
      default:
        return _page(
          const Scaffold(body: Center(child: Text('404 - Sayfa bulunamadı'))),
          settings,
        );
    }
  }

  Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return _page(const UnknownView(), settings);
  }

  // 🔹 Normal MaterialRoute
  MaterialPageRoute<dynamic> _page(Widget page, RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => page, settings: settings);
  }

  // 🔹 Fade animasyonlu geçiş
  // PageRouteBuilder<dynamic> _fadePage(Widget page, RouteSettings settings) {
  //   return PageRouteBuilder(
  //     pageBuilder: (_, __, ___) => page,
  //     settings: settings,
  //     transitionDuration: const Duration(milliseconds: 300),
  //     transitionsBuilder: (_, animation, __, child) =>
  //         FadeTransition(opacity: animation, child: child),
  //   );
  // }
}
