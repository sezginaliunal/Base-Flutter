import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/app/features/theme/cubit/theme_cubit.dart';
import 'package:test_project/core/config/constants/app/app_infos.dart';
import 'package:test_project/core/config/constants/app/app_keys.dart';
import 'package:test_project/core/config/constants/routes/navigation_route_pages.dart';
import 'package:test_project/core/config/constants/routes/navigation_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();

    return MaterialApp(
      title: AppInfos.appName,
      debugShowCheckedModeBanner: false,
      theme: themeCubit.state.themeData,
      navigatorKey: AppKeys.navigatorKey,
      initialRoute: RoutesName.init,
      onGenerateRoute: AppRouter.instance.onGenerateRoute,
      onUnknownRoute: AppRouter.instance.onUnknownRoute,
    );
  }
}
