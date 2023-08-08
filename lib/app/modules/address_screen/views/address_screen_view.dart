import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../data/addressScreen_widget/custom_text_button.dart';
import '../controllers/address_screen_controller.dart';

class AddressScreenView extends GetView<AddressScreenController> {
  const AddressScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: size.width * .035,
            right: size.width * .035,
            top: size.height * .08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                //back button
                Container(
                  alignment: Alignment.center,
                  height: size.height * .06,
                  width: size.width * .12,
                  decoration: BoxDecoration(
                    color: const Color(0xffe6e6e6).withOpacity(0.467),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(28, 27, 27, 0.07),
                        spreadRadius: 5,
                        blurRadius: 15.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: size.height * .025,
                      color: const Color(0xff7f7f7f),
                    ),
                  ),
                ),

                //Manage address
                Padding(
                  padding: EdgeInsets.only(left: size.width * .1),
                  child: const Text(
                    'Manage Address',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'semiBold'),
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(top: size.height * .01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //User NAme
                  Padding(
                    padding: EdgeInsets.only(top: size.height * .005),
                    child: Text(
                      ' ${controller.currentUSer.name.firstname} ${controller.currentUSer.name.lastname}',
                      maxLines: 5,
                      style: TextStyle(
                        fontSize: size.width * .045,
                        fontFamily: 'medium',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  //Address Field
                  Text(
                    ' ${controller.currentUSer.address.street}, ${controller.currentUSer.address.number},',
                    style: TextStyle(
                        fontSize: size.width * .045,
                        fontFamily: 'medium',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff000000).withOpacity(0.602)),
                  ),

                  //Country Field
                  Text(
                    '${controller.currentUSer.address.city},',
                    style: TextStyle(
                      fontSize: size.width * .045,
                      fontFamily: 'medium',
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff000000).withOpacity(0.602),
                    ),
                  ),

                  //Zip Field
                  Text(
                    '${controller.currentUSer.address.zipcode}.',
                    style: TextStyle(
                      fontSize: size.width * .045,
                      fontFamily: 'medium',
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff000000).withOpacity(0.602),
                    ),
                  ),

                  //PhoneNumber
                  RichText(
                    text: TextSpan(
                      text: 'Phone Number: ',
                      style: TextStyle(
                        fontSize: size.width * .045,
                        fontFamily: 'medium',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff000000).withOpacity(0.702)
                      ),
                      children: [
                        TextSpan(
                          text: '${controller.currentUSer.phone}.',
                          style: TextStyle(
                            fontSize: size.width * .045,
                            fontFamily: 'medium',
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff000000).withOpacity(0.602),
                          ),
                        )
                      ]
                    ),
                  ),

                  // Buttons
                  Padding(
                    padding: EdgeInsets.only(top: size.height * .01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Edit Button
                        CustomTextButton(
                          buttonName: 'EDIT',
                          onPressed: () {},
                        ),

                        //Delete button
                        CustomTextButton(
                            buttonName: 'DELETE', onPressed: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
