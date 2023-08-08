import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../main.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: GetBuilder(
        init: controller,
        builder: (controller) {
          return Center(
            child: Container(
              height: size.height * .15,
              width: size.width * .3,
              alignment: Alignment.center,
              child: Image.asset(
                'images/splash_logo.png',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
