import 'package:get/get.dart';
import 'package:test_project/app/features/deneme/deneme_controller.dart';

class DenemeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DenemeController>(DenemeController.new);
  }
}
