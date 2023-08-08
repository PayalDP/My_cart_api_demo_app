
import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_cart/app/data/APIs/APIFunctions.dart';

import '../../../model/products.dart';
import '../../../model/users.dart';

class HomeController extends GetxController {

  final APIFunctions functions = APIFunctions();
  User currentUser = Get.arguments;
  RxList<Product> popularProductsList = <Product>[].obs;

  @override
  Future<void> onInit() async {

    await popularProducts();

    super.onInit();
  }

  //get popular product list
  Future<List<Product>> popularProducts () async {

    List<Product> list = await functions.getAllProducts();

    List<Product> temp = list.where((element) => element.rating.rate >= 4.0).toList();

    popularProductsList.addAll(temp);

    log(popularProductsList.toString(), name: 'popList');

    return popularProductsList;

  }

}
