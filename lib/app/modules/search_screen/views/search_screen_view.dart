import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../main.dart';
import '../controllers/search_screen_controller.dart';

class SearchScreenView extends GetView<SearchScreenController> {
  const SearchScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus,
      child: Scaffold(
        body: GestureDetector(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.only(
                  top: size.height * .06,
                  right: size.width * .04,
                  left: size.width * .04),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      //back button
                      Container(
                        alignment: Alignment.center,
                        height: size.height * .06,
                        width: size.width * .11,
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

                      //search Bar
                      Padding(
                        padding: EdgeInsets.only(left: size.width * .03),
                        child: Container(
                          height: size.height * .06,
                          width: size.width * .77,
                          padding: EdgeInsets.only(
                              left: size.width * .05, bottom: size.height * .005),
                          decoration: BoxDecoration(
                            color: const Color(0xffe6e6e6).withOpacity(0.467),
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(28, 27, 27, 0.07),
                                  spreadRadius: 5,
                                  blurRadius: 15)
                            ],
                          ),
                          child: TextField(
                            controller: controller.textEditingController,
                            onChanged: (value) {
                              controller.searchProductList.clear();
                              controller.searchItem(value);
                            },
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search hear for item',
                                hintStyle: TextStyle()),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //sear List
                  Obx(
                    () => ListView.builder(
                      shrinkWrap: true,

                      itemCount: controller.searchProductList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * .005,
                                  horizontal: size.width * .03),
                              child: SizedBox(
                                height: size.height * .05,
                                child: Text(
                                  controller.searchProductList[index].title,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
