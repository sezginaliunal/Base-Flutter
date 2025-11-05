import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/app/features/theme/cubit/theme_cubit.dart';
import 'package:test_project/core/config/constants/app/app_infos.dart';
import 'package:test_project/core/config/constants/app/app_locale_keys.dart';
import 'package:test_project/core/extensions/string_extension.dart';
import 'package:test_project/core/extensions/widget_extension.dart';

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
            Text(AppLocaleKeys.error.locale),
            Text(
              isDark ? 'Switch to Light' : 'Switch to Dark',
            ).onTap(() => context.setLocale(AppInfos.locale.first)),
          ],
        ),
      ),
    );
  }
}
