// lib/core/routes/route_generator.dart
import 'package:flutter/material.dart';
import 'package:test_project/app/features/init/presentation/init_view.dart';
import 'package:test_project/core/widgets/unknown_view.dart';
import 'package:test_project/core/config/constants/routes/navigation_routes.dart';

class AppRouter {
  // 🔹 Singleton instance
  AppRouter._privateConstructor();
  static final AppRouter instance = AppRouter._privateConstructor();

  // 🔹 Route üreten ana method
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == RoutesName.init.path) {
      return _page(const InitPage(), settings);
    } else {
      return _page(
        const Scaffold(body: Center(child: UnknownView())),
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
}
