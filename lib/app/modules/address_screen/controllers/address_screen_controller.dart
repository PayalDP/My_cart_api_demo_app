import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../model/users.dart';



class AddressScreenController extends GetxController {

  User currentUSer = Get.arguments;
  final TextEditingController addressFieldController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

}
