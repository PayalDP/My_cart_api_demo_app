import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_cart/app/data/APIs/APIFunctions.dart';

import '../../../model/products.dart';



class CategoryScreenController extends GetxController {

  final APIFunctions functions = APIFunctions();
  final Category category = Get.arguments;
  RxList<Product> categoryProductList = <Product>[].obs;


  @override
  void onInit() {

    getCategoryProductList(category);

    super.onInit();
  }


  //get women category List
  Future<RxList<Product>> getCategoryProductList (Category category) async {

    log(category.toString(), name: 'Category');

    List<Product> allItems = await functions.getAllProducts();

    List<Product> list = allItems.where((element) => element.category == category).toList();

    categoryProductList.addAll(list);

    log(categoryProductList.toString(), name: 'Women Clothing');

    return categoryProductList;
  }
}