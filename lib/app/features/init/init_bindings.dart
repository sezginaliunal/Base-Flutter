import 'package:get/get.dart';
import 'package:test_project/app/features/init/init_controller.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitController>(InitController.new);
  }
}
