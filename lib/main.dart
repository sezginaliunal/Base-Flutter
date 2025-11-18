import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:test_project/core/config/constants/app/app_infos.dart';
import 'package:test_project/core/config/constants/app/app_providers.dart';
import 'package:test_project/core/config/di/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupLocator();

  runApp(
    EasyLocalization(
      supportedLocales: AppInfos.locale,
      path: AppInfos.translationsBase,
      fallbackLocale: AppInfos.locale.first,
      child: AppProviders().myApp,
    ),
  );
}
