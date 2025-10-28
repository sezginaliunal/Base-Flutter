import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/app/features/init/init_controller.dart';
import 'package:test_project/core/config/theme/theme_controller.dart';
import 'package:test_project/core/extensions/widget_extension.dart';

class InitPage extends GetView<InitController> {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Init', style: context.theme.textTheme.bodyLarge)
            .scale()
            .onTap(() {
              Get.find<ThemeController>().switchTheme();
            })
            .paddingNormal()
            .wrapInCard(),
      ),
    );
  }
}
