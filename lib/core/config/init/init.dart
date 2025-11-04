import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_project/core/config/constants/hive/hive_boxes.dart';
import 'package:test_project/core/utils/logger.dart';

Future<void> init() async {
  await Hive.initFlutter();
  await Hive.openBox<int>(HiveBoxConstants.theme.value);

  Logger.log(LogLevel.info, 'App başlıyor');
}
