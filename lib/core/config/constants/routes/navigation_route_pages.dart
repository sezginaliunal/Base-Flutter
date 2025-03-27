import 'package:get/get.dart';
import 'package:test_project/app/features/init/init_bindings.dart';
import 'package:test_project/app/features/init/init_page.dart';
import 'package:test_project/core/components/unknown_view.dart';
import 'package:test_project/core/config/constants/routes/navigation_routes.dart';

class AppRouter {
  // Singleton instance
  factory AppRouter() => _instance;
  AppRouter._privateConstructor();
  static final AppRouter _instance = AppRouter._privateConstructor();

  // GetX'de sayfa rotaları
  List<GetPage<dynamic>> getPages() {
    return [
      GetPage(
        name: RoutesName.initialRoute,
        page: InitPage.new,
        binding: InitBinding(),
      ),
      GetPage(name: RoutesName.unknown, page: () => const UnknownView()),
    ];
  }
}
