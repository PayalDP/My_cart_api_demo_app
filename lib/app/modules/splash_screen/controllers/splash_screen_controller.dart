import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);

    getSplash();

    super.onInit();
  }

  //splash screen logic
  Future getSplash() async {
    return Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.offAllNamed(Routes.LOG_IN_SCREEN);
    });
  }
}
