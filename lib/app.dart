import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/app/features/init/init_binding.dart';
import 'package:test_project/core/config/constants/app/app_infos.dart';
import 'package:test_project/core/config/constants/app/app_keys.dart';
import 'package:test_project/core/config/constants/routes/navigation_route_pages.dart';
import 'package:test_project/core/config/constants/routes/navigation_routes.dart';
import 'package:test_project/core/theme/theme_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(
      () => GetMaterialApp(
        title: AppInfos.appName,
        debugShowCheckedModeBanner: false,
        navigatorKey: AppKeys().navigatorKey,
        getPages: AppRouter().getPages(),
        initialBinding: InitBinding(),
        theme: themeController.state.themeData,
        initialRoute: RoutesName.init.path,
      ),
    );
  }
}
