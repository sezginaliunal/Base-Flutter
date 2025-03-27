import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_project/app/features/init/init_controller.dart';
import 'package:test_project/core/config/constants/hive/hive_boxes.dart';
import 'package:test_project/core/config/theme/theme_controller.dart';
import 'package:test_project/core/utils/logger.dart';

Future<void> init() async {
  await Hive.initFlutter();
  await Hive.openBox<String>(HiveBoxConstants.theme.value);

  Get
    ..lazyPut<ThemeController>(ThemeController.new)
    ..lazyPut<InitController>(InitController.new);

  Logger.log(LogLevel.info, 'İnit Methodu sonu');
}
