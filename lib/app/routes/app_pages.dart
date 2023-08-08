import 'package:get/get.dart';

import '../modules/address_screen/bindings/address_screen_binding.dart';
import '../modules/address_screen/views/address_screen_view.dart';
import '../modules/cart_screen/bindings/cart_screen_binding.dart';
import '../modules/cart_screen/views/cart_screen_view.dart';
import '../modules/category_screen/bindings/category_screen_binding.dart';
import '../modules/category_screen/views/category_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/logIn_screen/bindings/log_in_screen_binding.dart';
import '../modules/logIn_screen/views/log_in_screen_view.dart';
import '../modules/myOrder_screen/bindings/my_order_screen_binding.dart';
import '../modules/myOrder_screen/views/my_order_screen_view.dart';
import '../modules/productDetail_screen/bindings/product_detail_screen_binding.dart';
import '../modules/productDetail_screen/views/product_detail_screen_view.dart';
import '../modules/profile_screen/bindings/profile_screen_binding.dart';
import '../modules/profile_screen/views/profile_screen_view.dart';
import '../modules/search_screen/bindings/search_screen_binding.dart';
import '../modules/search_screen/views/search_screen_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOG_IN_SCREEN,
      page: () => const LogInScreenView(),
      binding: LogInScreenBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS_SCREEN,
      page: () => const AddressScreenView(),
      binding: AddressScreenBinding(),
    ),
    GetPage(
      name: _Paths.CART_SCREEN,
      page: () => const CartScreenView(),
      binding: CartScreenBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAIL_SCREEN,
      page: () => const ProductDetailScreenView(),
      binding: ProductDetailScreenBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY_SCREEN,
      page: () => const CategoryScreenView(),
      binding: CategoryScreenBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_SCREEN,
      page: () => const SearchScreenView(),
      binding: SearchScreenBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_SCREEN,
      page: () => const ProfileScreenView(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.MY_ORDER_SCREEN,
      page: () => const MyOrderScreenView(),
      binding: MyOrderScreenBinding(),
    ),
  ];
}
