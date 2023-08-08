import 'package:get/get.dart';

import '../controllers/log_in_screen_controller.dart';

class LogInScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogInScreenController>(
      () => LogInScreenController(),
    );
  }
}
