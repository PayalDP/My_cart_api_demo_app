import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_order_screen_controller.dart';

class MyOrderScreenView extends GetView<MyOrderScreenController> {
  const MyOrderScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyOrderScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyOrderScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
