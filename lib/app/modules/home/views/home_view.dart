import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../main.dart';
import '../../../data/homeScreen_widget/categories_and_button_Row.dart';
import '../../../data/homeScreen_widget/popular_item_card.dart';
import '../../../data/homeScreen_widget/top_category_item_card.dart';
import '../../../model/products.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: size.height * .03),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: size.width * .035,
                ),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: size.height * .06,
                      width: size.width * .11,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(28, 27, 27, 0.07),
                            spreadRadius: 5,
                            blurRadius: 15.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(6),
                      ),

                      //Location button
                      child: IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.ADDRESS_SCREEN,
                                arguments: controller.currentUser);
                          },
                          icon: const Icon(
                            Icons.location_on_outlined,
                            color: Color(0xff000000),
                          )),
                    ),

                    //search Bar
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .02),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * .01),
                        height: size.height * .07,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(28, 27, 27, 0.07),
                                spreadRadius: 5,
                                blurRadius: 15)
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: size.width * .015),
                              width: size.width * .645,
                              child: TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.SEARCH_SCREEN);
                                },
                                style: const ButtonStyle(
                                  alignment: Alignment.centerLeft,
                                ),
                                child: Text(
                                  'Search here',
                                  style: TextStyle(
                                      fontSize: size.height * .027,
                                      color: const Color(0xff7b7b7b),
                                      fontFamily: 'regular'),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.search_sharp),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Categories & filter Row
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * .02,
                  left: size.width * .035,
                ),
                child: const CategoriesAndButtonRow(
                  categoryName: 'Top Categories',
                ),
              ),

              //categories ListView
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * .01,
                  left: size.width * .035,
                ),
                child: SizedBox(
                  height: size.height * .3,
                  // width: size.width* .9,
                  width: size.width,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: const [
                      //women category
                      TopCategoryItemCard(
                          itemImagePath: 'images/woman_clothing_image.jpg',
                          itemName: "Women's Clothing",
                      category: Category.WOMEN_S_CLOTHING),

                      //men's category
                      TopCategoryItemCard(
                          itemName: "Men's clothing",
                          itemImagePath: "images/men's_clothing_image.jpg",
                      category: Category.MEN_S_CLOTHING),

                      //jewellery
                      TopCategoryItemCard(
                          itemName: "Jewellery",
                          itemImagePath: "images/jewellery_image.jpg",
                      category: Category.JEWELERY),

                      //Electronics
                      TopCategoryItemCard(
                          itemName: "Electronics",
                          itemImagePath: "images/electronics_image.jpg",
                      category: Category.ELECTRONICS),
                    ],
                  ),
                ),
              ),

              //Divider
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xffdfdfdf),
                ),
                height: size.height * .001,
              ),

              //Row for Popular text and viewAll
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * .035, top: size.width * .03),
                child: const CategoriesAndButtonRow(
                  categoryName: 'Popular Items',
                  // button: TextButton(
                  //   onPressed: () {},
                  //   child: const Text(
                  //     'View all',
                  //     style: TextStyle(
                  //         fontSize: 14,
                  //         fontFamily: 'medium',
                  //         color: Color(0xff818181),
                  //         fontWeight: FontWeight.w500),
                  //   ),
                  // ),
                ),
              ),

              //Popular item List
              Padding(
                padding: EdgeInsets.only(left: size.width * .035),
                child: Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: controller.popularProductsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [

                          PopularItemCard(
                            productTitle:
                                controller.popularProductsList[index].title,
                            price: controller.popularProductsList[index].price,
                            productImageUrl:
                                controller.popularProductsList[index].image,
                            rate: controller
                                .popularProductsList[index].rating.rate,
                            reviews: controller
                                .popularProductsList[index].rating.count,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      //Bottom bar
      bottomNavigationBar: Container(
        height: size.height * .08,
        decoration: const BoxDecoration(
          color: Color(0xffd9fcf7),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //home screen
            IconButton(
              onPressed: () {},
              icon: Image.asset('images/home_icon.png'),
            ),

            //cart screen
            IconButton(
              icon: Image.asset('images/cart_icon.png'),
              onPressed: () {
                Get.toNamed(Routes.CART_SCREEN,
                    arguments: controller.currentUser);
              },
            ),

            //Profile icon
            IconButton(
              icon: Image.asset('images/profile_Icon.png'),
              onPressed: () {
                Get.toNamed(Routes.PROFILE_SCREEN, arguments: controller.currentUser);
              },
            ),
          ],
        ),
      ),
    );
  }
}
