import 'package:go_router/go_router.dart';
import 'package:baseflutter/core/constants/app_routes.dart';
import 'package:baseflutter/features/auth/presentation/pages/login_page.dart';

/// App router configuration using GoRouter
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      // Add more routes here
      // GoRoute(
      //   path: AppRoutes.register,
      //   builder: (context, state) => const RegisterPage(),
      // ),
      // GoRoute(
      //   path: AppRoutes.home,
      //   builder: (context, state) => const HomePage(),
      // ),
    ],
  );
}
