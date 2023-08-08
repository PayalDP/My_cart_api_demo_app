import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../data/cartScreen/add_number_dialog.dart';
import '../../../data/cartScreen/bill_detail_item_card.dart';
import '../../../data/cartScreen/cart_item_card.dart';
import '../../../routes/app_pages.dart';
import '../controllers/cart_screen_controller.dart';

class CartScreenView extends GetView<CartScreenController> {
  const CartScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: const Color(0xfff8f6f6),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
                top: size.height * .05,
                left: size.width * .035,
                right: size.width * .035),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Cart
                const Text(
                  'Cart',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'semiBold'),
                ),

                Flexible(
                  fit: FlexFit.loose,
                  child: Obx(() => ListView.builder(
                    itemCount: controller.cartItems.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          //Cart Item Card
                          CarItemCard(controller: controller, price: controller.cartItems[index].price, imageUrl: controller.cartItems[index].image, productTitle: controller.cartItems[index].title, productDescription: controller.cartItems[index].description, productID: controller.cartItems[index].id),
                        ],
                      );
                    },
                  ),),
                ),

                //Bill Detail
                Padding(
                  padding: EdgeInsets.only(top: size.height * .01),
                  child: Text(
                    'Bill Details',
                    style: TextStyle(
                        fontSize: size.width * .045,
                        fontFamily: 'semiBold',
                        fontWeight: FontWeight.w600),
                  ),
                ),

                //total bill price
                Obx(() => BillDetailItemCard(
                  price: controller.totalItemPrice.value,
                  itemTitle: 'Item Total',
                ),),

                //Delivery fee
                const BillDetailItemCard(
                    price: 01.00, itemTitle: 'Delivery Fee'),

                //offer
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Total item
                    Text(
                      'Offer 10% OFF',
                      style: TextStyle(
                          fontFamily: 'medium',
                          fontSize: size.width * .04,
                          color: const Color(0xff000000).withOpacity(0.502),
                          fontWeight: FontWeight.w500),
                    ),

                    //price
                    Text(
                      '-€03.03',
                      style: TextStyle(
                        fontFamily: 'medium',
                        fontSize: size.width * .04,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),

                Divider(
                  color: const Color(0xff909090).withOpacity(0.200),
                  thickness: size.height * .002,
                ),

                //total bill text
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Total item
                    Text(
                      'Total',
                      style: TextStyle(
                          fontFamily: 'semiBold',
                          fontSize: size.width * .043,
                          fontWeight: FontWeight.w600),
                    ),

                    //total bill price
                    Obx(() => Text(
                      '${controller.totalBillAmount.value}',
                      style: TextStyle(
                        fontFamily: 'semiBold',
                        fontSize: size.width * .043,
                        fontWeight: FontWeight.w600,
                      ),
                    ),),
                  ],
                ),

                Divider(
                  color: const Color(0xff909090).withOpacity(0.200),
                  thickness: size.height * .002,
                ),

                //Any Request for restaurant
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Any request for the restaurant?',
                      style: TextStyle(
                          fontFamily: 'medium',
                          fontSize: size.width * .034,
                          color: const Color(0xff000000)
                              .withOpacity(0.502)
                              .withOpacity(0.502),
                          fontWeight: FontWeight.w500),
                    ),
                    Image.asset('images/Edit_icon.png'),
                  ],
                ),

                //discount code
                Padding(
                  padding: EdgeInsets.only(top: size.height * .01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DottedBorder(
                        strokeWidth: 2,
                        dashPattern: const [5, 6],
                        borderType: BorderType.RRect,
                        color: const Color(0xff7f7f7f).withOpacity(0.498),
                        radius: const Radius.circular(6),
                        child: Container(
                          height: size.height * .041,
                          width: size.width * .53,
                          padding: EdgeInsets.only(top: size.height * .017),
                          child: TextField(
                            controller: controller.couponController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Enter Discount Code',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                fontFamily: 'medium',
                                fontSize: size.width * .04,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff7f7f7f)
                                    .withOpacity(0.498),
                              ),
                            ),
                          ),
                        ),
                      ),

                      //apply button
                      Container(
                          alignment: Alignment.center,
                          height: size.height * .05,
                          width: size.width * .36,
                          decoration: BoxDecoration(
                              color: const Color(0xff7f7f7f),
                              borderRadius: BorderRadius.circular(6)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff7f7f7f),
                              elevation: 0,
                              fixedSize: Size.fromWidth(size.width),
                            ),
                            child: Text(
                              'APPLY',
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: size.width * .04,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: size.height * .01),
                  child: Divider(
                    color: const Color(0xff909090).withOpacity(0.200),
                    thickness: size.height * .002,
                  ),
                ),

                //almost there and proceed button
                Container(
                  height: size.height * .17,
                  width: size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      topLeft: Radius.circular(6),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //almost there
                      Text(
                        'Almost There',
                        style: TextStyle(
                            fontSize: size.width * .045,
                            fontFamily: 'semiBold',
                            fontWeight: FontWeight.w600),
                      ),

                      //login / create
                      Text(
                        'Login/Create Account quickly to place order.',
                        style: TextStyle(
                          fontFamily: 'regular',
                          fontSize: size.width * .0415,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff000000).withOpacity(0.502),
                        ),
                      ),

                      //Proceed button
                      Padding(
                        padding: EdgeInsets.only(top: size.height * .01),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.bottomSheet(
                              AddNumberDialog(
                                controller: controller,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffd9fcf7),
                              fixedSize: Size.fromWidth(size.width)),
                          child: Text(
                            'PROCEED',
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: size.width * .04,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff31b0de),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
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
                onPressed: () {
                  Get.toNamed(Routes.HOME);
                },
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
      ),
    );
  }
}

