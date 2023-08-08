import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/users.dart';



class ProfileScreenController extends GetxController {

  final TextEditingController countryCodeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  User currentUser = Get.arguments;

  @override
  void onInit() {
    super.onInit();
  }

}
