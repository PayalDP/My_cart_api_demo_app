import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../modules/cart_screen/controllers/cart_screen_controller.dart';
import '../../routes/app_pages.dart';
class AddNumberDialog extends StatelessWidget {
  const AddNumberDialog({super.key, required this.controller});

  final CartScreenController controller;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(size.width * .04),
              topRight: Radius.circular(size.width * .04),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                right: size.width * .035,
                left: size.width * .035,
                top: size.height * .03),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //almost there
                DefaultTextStyle(
                  style: TextStyle(
                      color: const Color(0xff000000),
                      fontSize: size.width * .045,
                      fontFamily: 'semiBold',
                      fontWeight: FontWeight.w600),
                  child: const Text(
                    'Almost there!',
                  ),
                ),

                //login/create account
                DefaultTextStyle(
                  style: TextStyle(
                    fontFamily: 'regular',
                    fontSize: size.width * .0415,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff000000).withOpacity(0.502),
                  ),
                  child: const Text(
                    'Login/Create Account quickly to place order.',
                  ),
                ),

                SizedBox(
                  height: size.height* .01,
                ),

                //Phone number text
                DefaultTextStyle(
                  style: TextStyle(
                      fontFamily: 'regular',
                      fontSize: size.width * .034,
                      fontWeight: FontWeight.w400,
                    color: const Color(0xff000000),
                  ),
                  child: const Text('Mobile Number'),
                ),

                //row for country.Code and Phone.No
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Country code
                    Container(
                      height: size.height * .065,
                      width: size.width * .19,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width * .007),
                        border: Border.all(
                            color: const Color(0xffe3e3e3), width: 1.5),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * .02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //Country code
                            Container(
                              height: size.height * .02,
                              width: size.width * .05,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(size.width * .007),
                                border: Border.all(
                                    color: const Color(0xffe3e3e3), width: 1.5),
                              ),
                              child: Image.asset(
                                'images/usa_flag.png',
                                fit: BoxFit.cover,
                              ),
                            ),

                            Container(
                              alignment: Alignment.center,
                              height: size.height * .04,
                              width: size.width * .08,
                              child: Card(
                                elevation: 0,
                                child: TextField(
                                  controller: controller.countryCodeController
                                    ..text = '+1',
                                  style: TextStyle(
                                    fontFamily: 'regular',
                                    fontSize: size.width * .03,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Phone number Text field
                    Container(
                      padding: EdgeInsets.only(top: size.height * .021),
                      height: size.height * .065,
                      width: size.width * .73,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width * .007),
                        border: Border.all(
                            color: const Color(0xffe3e3e3), width: 1.5),
                      ),
                      child: Card(
                        elevation: 0,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: controller.phoneNumberController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '000 000 0000',
                            hintStyle: TextStyle(
                              fontFamily: 'regular',
                              fontSize: size.width * .035,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //Continue button
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * .01),
                  child: ElevatedButton(
                    onPressed: () {
                      // Get.toNamed();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfff51929),
                        fixedSize: Size.fromWidth(size.width)),
                    child: Text(
                      'CONTINUE',
                      style: TextStyle(
                        fontFamily: 'medium',
                        fontSize: size.width * .04,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
