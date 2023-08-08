import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_cart/app/data/profileScreen_widget/profileScreen_item_card.dart';

import '../../../../main.dart';
import '../../../data/profileScreen_widget/edit_dialog.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_screen_controller.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  const ProfileScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f6f6),
      body: Container(
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(size.width * .03),
            bottomLeft: Radius.circular(
              size.width * .04,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              right: size.width * .035,
              left: size.width * .035,
              top: size.height * .07,
              bottom: size.height * .02),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Name & MailId Row
              SizedBox(
                height: size.height * .09,
                width: size.width,
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Profile Name
                        Text(
                          controller.currentUser.username,
                          style: TextStyle(
                            fontSize: size.width * .046,
                            fontFamily: 'semiBold',
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        //edite button
                        TextButton(
                          onPressed: () {
                            Get.bottomSheet(
                              EditBottomSheet(
                                controller: controller,
                              ),
                            );
                          },
                          style: ButtonStyle(
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent),
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: Text(
                            'EDIT',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: size.width * .033,
                                fontFamily: 'medium',
                                color: const Color(0xfff51929),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),

                    //EmailId Text
                    Positioned(
                      top: size.height * .055,
                      child: Text(
                        controller.currentUser.email,
                        style: TextStyle(
                            fontSize: size.width * .035,
                            fontFamily: 'medium',
                            color: const Color(0xff000000).withOpacity(0.502),
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),

              //My Order
              ProFileScreenItemCard(
                  itemName: 'My Orders',
                  iconPath: 'images/My_order_icon.png',
                  pagePath: Routes.MY_ORDER_SCREEN,
                  argument: controller.currentUser),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                child: Divider(
                  color: const Color(0xff20273f),
                  thickness: size.width * .001,
                ),
              ),

              //Manage Address
              ProFileScreenItemCard(
                  itemName: 'Manage Address',
                  iconPath: 'images/manage_address.png',
                  pagePath: Routes.ADDRESS_SCREEN,
                  argument: controller.currentUser),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                child: Divider(
                  color: const Color(0xff20273f),
                  thickness: size.width * .001,
                ),
              ),

              //Payments
              const ProFileScreenItemCard(
                itemName: 'Payments',
                iconPath: 'images/payment_icon.png',
                pagePath: '',
                argument: null,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                child: Divider(
                  color: const Color(0xff20273f),
                  thickness: size.width * .001,
                ),
              ),

              //Favourites
              const ProFileScreenItemCard(
                itemName: 'Favourites',
                iconPath: 'images/favorites_icon.png',
                pagePath: '',
                argument: null,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                child: Divider(
                  color: const Color(0xff20273f),
                  thickness: size.width * .001,
                ),
              ),

              //Help
              const ProFileScreenItemCard(
                itemName: 'Help',
                iconPath: 'images/help_icon.png',
                pagePath: '',
                argument: null,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                child: Divider(
                  color: const Color(0xff20273f),
                  thickness: size.width * .001,
                ),
              ),

              //logOut
              const ProFileScreenItemCard(
                itemName: 'Logout',
                iconPath: 'images/logOut_icon.png',
                pagePath: '',
                argument: null,
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
                Get.toNamed(Routes.PROFILE_SCREEN);
              },
            ),
          ],
        ),
      ),
    );
  }
}
