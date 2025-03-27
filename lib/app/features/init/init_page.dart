import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/app/features/init/init_controller.dart';

class InitPage extends GetView<InitController> {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Init')));
  }
}
