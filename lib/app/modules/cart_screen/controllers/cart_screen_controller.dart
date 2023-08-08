import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_cart/app/data/APIs/APIFunctions.dart';
import '../../../model/cart.dart' as cart;
import '../../../model/products.dart';
import '../../../model/users.dart';

class CartScreenController extends GetxController {
  final APIFunctions functions = APIFunctions();
  final TextEditingController countryCodeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController couponController = TextEditingController();
  final User currentUser = Get.arguments;
  List<cart.Product> cartProductIdsList = [];
  RxList<Product> cartItems = <Product>[].obs;
  RxDouble totalItemPrice = 0.0.obs;
  RxDouble totalBillAmount = 0.0.obs;
  RxDouble deliveryFees = 1.0.obs;
  RxDouble discountAmount = 03.03.obs;

  @override
  Future<void> onInit() async {
    cartProductIdsList.addAll(await functions.getCartProducts(currentUser.id));

    await getCartItems(cartProductIdsList).then((value) => getTotalAmount(value)).then((value) => getBillAmount(value));

    super.onInit();
  }

  //get cartItem List
  Future<List<Product>> getCartItems(List<cart.Product> idList) async {
    List<Product> allProducts = await functions.getAllProducts();

    for (var i in idList) {
      List<Product> temp =
          allProducts.where((element) => element.id == i.productId).toList();

      log(temp.toString(), name: 'cartItems');

      cartItems.addAll(temp);
    }

    return cartItems;
  }

  //add quantity of item
  addItemQuantity(int quantity) {
    if (quantity < 10) {
      quantity++;
    }
  }

  //remove quantity if item
  removeItemQuantity(int quantity) {
    if (quantity > 0) {
      quantity--;
    }
  }

  //remove item from cart
  removeItem(int productId) {
    cartItems.remove(cartItems.firstWhere((p0) => p0.id == productId));
  }

  //get total item price amount
  double getTotalAmount(List<Product> productList) {
    double amount = 0;

    for (var i in productList) {
      amount = amount + i.price;
    }

    totalItemPrice.value = amount;

    log(totalItemPrice.toString(), name: 'totalAmount');

    return totalItemPrice.value;
  }

  //final bill amount]
  double getBillAmount(double totalItemPrice) {

    double tempAmount = 0.0;

    tempAmount = totalItemPrice + deliveryFees.value;

    tempAmount = tempAmount - discountAmount.value;

    totalBillAmount.value = tempAmount;

    log(totalBillAmount.toString(), name: 'totalBillAmount');

    return totalBillAmount.value;

  }
}
