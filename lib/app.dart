import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/app/features/theme/bloc/theme_cubit.dart';
import 'package:test_project/app/features/theme/bloc/theme_state.dart';
import 'package:test_project/core/config/constants/app/app_infos.dart';
import 'package:test_project/core/config/constants/app/app_keys.dart';
import 'package:test_project/core/config/constants/routes/navigation_route_pages.dart';
import 'package:test_project/core/config/constants/routes/navigation_routes.dart';

class MyApp extends StatelessWidget {
  final AppTheme initialTheme;
  const MyApp({super.key, required this.initialTheme});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit()..setTheme(initialTheme),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: AppInfos.appName,
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            navigatorKey: AppKeys.navigatorKey,
            initialRoute: RoutesName.init,
            onGenerateRoute: AppRouter.instance.onGenerateRoute,
            onUnknownRoute: AppRouter.instance.onUnknownRoute,
          );
        },
      ),
    );
  }
}
