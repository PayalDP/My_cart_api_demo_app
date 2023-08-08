import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_detail_screen_controller.dart';

class ProductDetailScreenView extends GetView<ProductDetailScreenController> {
  const ProductDetailScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductDetailScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProductDetailScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
