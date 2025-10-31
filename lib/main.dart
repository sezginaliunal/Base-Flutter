import 'package:flutter/material.dart';
import 'package:test_project/core/config/init/init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
}
