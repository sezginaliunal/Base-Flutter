import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/app/features/deneme/deneme_controller.dart';

class DenemePage extends GetView<DenemeController> {
  const DenemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deneme')),
      body: const Center(child: Text('Hello Deneme')),
    );
  }
}
