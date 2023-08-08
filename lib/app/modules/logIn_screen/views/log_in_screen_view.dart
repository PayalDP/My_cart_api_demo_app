import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../routes/app_pages.dart';
import '../controllers/log_in_screen_controller.dart';

class LogInScreenView extends GetView<LogInScreenController> {
  const LogInScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: const Color(0xfff8f6f6),
          body: Stack(
            children: [
              //LogIn text
              Positioned(
                top: size.height * .181,
                width: size.width * .3,
                left: size.width * .38,
                child: const Text(
                  'LogIn',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'semiBold',
                  ),
                ),
              ),

              //User id
              Positioned(
                top: size.height * .288,
                left: size.width * .05,
                child: const Text(
                  'User ID',
                  style: TextStyle(fontSize: 15, fontFamily: 'regular'),
                ),
              ),

              //User input field
              Positioned(
                top: size.height * .33,
                left: size.width * .05,
                right: size.width * .05,
                child: SizedBox(
                  height: size.height * .055,
                  child: TextField(
                    controller: controller.userNameController,
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                      fillColor: const Color(0xffffffff),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          color: Color(0xff7f7f7f),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                            color: Color(0xffe3e3e3), width: 1.5),
                      ),
                      hintText: 'User Id',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color: Color(0xffbebebe),
                      ),
                    ),
                  ),
                ),
              ),

              //Password
              Positioned(
                top: size.height * .41,
                left: size.width * .05,
                child: const Text(
                  'Password',
                  style: TextStyle(fontSize: 15, fontFamily: 'regular'),
                ),
              ),

              //Password Text field
              Positioned(
                top: size.height * .45,
                left: size.width * .05,
                right: size.width * .05,
                child: SizedBox(
                  height: size.height * .055,
                  child: TextField(
                    controller: controller.pwdController,
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                      fillColor: const Color(0xffffffff),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          color: Color(0xff7f7f7f),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                            color: Color(0xffe3e3e3), width: 1.5),
                      ),
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color: Color(0xffbebebe),
                      ),
                    ),
                  ),
                ),
              ),

              //Login button
              Positioned(
                top: size.height * .59,
                left: size.width * .05,
                right: size.width * .05,
                child: SizedBox(
                  height: size.height * .055,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfff51929)),
                    onPressed: () {
                      controller
                          .logIn(controller.userNameController.text,
                              controller.pwdController.text)
                          .then((value) {

                            log(controller.logInUser.toString(), name: 'logInUser');

                        Get.offAllNamed(Routes.HOME,
                            arguments: controller.logInUser);
                      });
                    },
                    child: const Text(
                      'LogIn',
                      style: TextStyle(fontSize: 17, fontFamily: 'semiBold'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
