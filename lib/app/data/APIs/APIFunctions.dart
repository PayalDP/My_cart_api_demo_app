

import 'package:http/http.dart' as http;
import '../../model/cart.dart' as cart;
import '../../model/products.dart';
import '../../model/users.dart';

class APIFunctions {

  //get all Users List
  Future<List<User>> getUSerList () async {

    http.Response response = await http.get(Uri.parse('https://fakestoreapi.com/users'));

    return userFromJson(response.body);

  }

  //get all products
  Future<List<Product>> getAllProducts () async {

    List<Product> products = [];

    http.Response response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if(response.statusCode == 200){

      products.addAll(productFromJson(response.body));

    }

    return products;

  }

  //get cart item's products
  Future<List<cart.Product>> getCartProducts (int userId) async {

    List<cart.Product> cartProductIds = [];

    http.Response response = await http.get(Uri.parse('https://fakestoreapi.com/carts'));

    if(response.statusCode == 200){

        List<cart.Cart> list = cart.cartFromJson(response.body);

        cart.Cart cartItem = list.firstWhere((element) => element.userId == userId);

        cartProductIds.addAll(cartItem.products);
    }

    return cartProductIds;

  }

  //log in function
  Future<User> logIn (String userName, String password) async {

    var users = await getUSerList();

    var user =  users.where((element) => element.username==userName && element.password==password);

    return user.first;

  }

  //Popular Products
  Future<List<Product>> getPopularProducts () async {

    List<Product> popularProducts = [];

    List<Product> list = await getAllProducts();

    popularProducts.addAll(list.where((product) => product.rating.rate >= 4.0));

    return popularProducts;
  }

}