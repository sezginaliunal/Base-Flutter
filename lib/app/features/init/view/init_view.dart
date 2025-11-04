import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/app/features/theme/cubit/theme_cubit.dart';
import 'package:test_project/core/config/constants/routes/navigation_routes.dart';
import 'package:test_project/core/extensions/widget_extension.dart';
import 'package:test_project/core/utils/app_navigation.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state.isDark;
    return Scaffold(
      appBar: AppBar(title: const Text('Tema Test Sayfası')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isDark ? 'Switch to Light' : 'Switch to Dark',
            ).onTap(() => AppNav.pushNamed(RoutesName.dummy)),
          ],
        ),
      ),
    );
  }
}
