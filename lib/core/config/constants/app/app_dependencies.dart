import 'package:hive_flutter/hive_flutter.dart';

class AppDependencies {
  static Future<void> init() async {
    await Hive.initFlutter();

    _registerCompanyCaches();
  }

  static void _registerCompanyCaches() {}
}
