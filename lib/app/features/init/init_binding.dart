import 'package:get/get.dart';

import 'package:test_project/app/features/init/init_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    // Controller EN SON
    Get.lazyPut<InitController>(() => InitController());
    print("object");
  }
}
