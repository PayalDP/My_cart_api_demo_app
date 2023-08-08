import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_cart/app/data/APIs/APIFunctions.dart';

import '../../../model/products.dart';

class SearchScreenController extends GetxController {

  final APIFunctions functions = APIFunctions();
  final TextEditingController textEditingController = TextEditingController();
  final StreamController searchController = StreamController();
  RxList<Product> searchProductList = <Product>[].obs;

  @override
  void onInit() {

    searchController.sink.add(textEditingController.text);

    super.onInit();
  }

  //logic gor search item
   Future<void> searchItem (String text) async {

    List<Product> list = await functions.getAllProducts();
    searchProductList.clear();

    if(text.isNotEmpty){

      for(var i in list){
        if(i.title.toLowerCase().contains(text.toLowerCase())){
          searchProductList.add(i);
        }
      }

    }
    log(searchProductList.toString(), name: 'searchList');

  }

}
