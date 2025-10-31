import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_project/app.dart';
import 'package:test_project/app/features/theme/bloc/theme_state.dart';
import 'package:test_project/core/config/constants/hive/hive_boxes.dart';
import 'package:test_project/core/utils/logger.dart';

Future<void> init() async {
  await Hive.initFlutter();
  await Hive.openBox<dynamic>(HiveBoxConstants.theme.value);

  final box = Hive.box(HiveBoxConstants.theme.value);
  final themeIndex =
      box.get(HiveBoxConstants.theme.value, defaultValue: 0) as int;
  final initialTheme = AppTheme.values[themeIndex];
  Logger.log(LogLevel.info, 'İnit Methodu sonu');

  runApp(MyApp(initialTheme: initialTheme));
  Logger.log(LogLevel.info, 'App başlıyor');
}
