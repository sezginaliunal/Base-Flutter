import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/core/components/unknown_view.dart';
import 'package:test_project/core/config/constants/app/app_infos.dart';
import 'package:test_project/core/config/constants/routes/navigation_route_pages.dart';
import 'package:test_project/core/config/constants/routes/navigation_routes.dart';
import 'package:test_project/core/config/theme/theme_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(
      () => GetMaterialApp(
        title: AppInfos.appName,
        debugShowCheckedModeBanner: false,
        theme: themeController.getThemeData(),
        initialRoute: RoutesName.initialRoute,
        getPages: AppRouter().getPages(),
        unknownRoute: GetPage(
          name: RoutesName.unknown,
          page: () => const UnknownView(),
        ),
      ),
    );
  }
}
