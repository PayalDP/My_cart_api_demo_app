import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../main.dart';
import '../controllers/category_screen_controller.dart';

class CategoryScreenView extends GetView<CategoryScreenController> {
  const CategoryScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.only(top: size.height * .06, right: size.width* .04, left: size.width* .04),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //back button & category text
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

                //category text
                Padding(
                  padding: EdgeInsets.only(left: size.width* .05),
                  child: Text(
                    controller.category.name,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'semiBold'),
                  ),
                ),
              ],
            ),

            Flexible(
              fit: FlexFit.loose,
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.categoryProductList.length,
                  itemBuilder: (context, index) {
                    return ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: size.width* .01,
                             ),
                          child: Container(
                            width: size.width * .65,
                            padding: EdgeInsets.all(size.width * .02),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: const Color(0xffffffff),
                              border: Border.all(
                                color: const Color(0xffefefef),
                              ),
                            ),
                            child: Stack(
                              children: [
                                //item image
                                Positioned(
                                  child: Container(
                                    height: size.height * .15,
                                    width: size.width * .22,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          color: const Color(0xff000000)
                                              .withOpacity(0.102)),
                                      image: DecorationImage(
                                          image: NetworkImage(controller
                                              .categoryProductList[index].image),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),

                                //Product Title
                                Positioned(
                                  left: size.width * .25,
                                  right: size.width * .01,
                                  child: Text(
                                    controller.categoryProductList[index].title,
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: size.width * .04,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'medium'),
                                  ),
                                ),

                                //Divider
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size.width * .11,
                                      left: size.width * .25,
                                      right: size.width * .3),
                                  child: Divider(
                                    thickness: 1,
                                    color: const Color(0xff909090)
                                        .withOpacity(0.200),
                                  ),
                                ),

                                //Prices
                                Positioned(
                                  left: size.width * .25,
                                  top: size.height * .08,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      //rate
                                      Text(
                                        '${controller.categoryProductList[index].rating.rate}',
                                        style: TextStyle(
                                            fontSize: size.width * .04,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'regular',
                                            color: const Color(0xff000000)
                                                .withOpacity(0.502)),
                                      ),

                                      SizedBox(
                                        width: size.width * .005,
                                      ),

                                      //ratting icon
                                      SizedBox(
                                          height: size.height * .017,
                                          child: Image.asset(
                                            'images/ratting_icon.png',
                                            fit: BoxFit.cover,
                                          )),

                                      SizedBox(
                                        width: size.width * .02,
                                      ),

                                      //reviews
                                      Text(
                                        '${controller.categoryProductList[index].rating.count} Reviews',
                                        style: TextStyle(
                                            fontSize: size.width * .04,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'regular',
                                            color: const Color(0xff000000)
                                                .withOpacity(0.502)),
                                      ),
                                    ],
                                  ),
                                ),

                                //Price
                                Positioned(
                                  top: size.height * .11,
                                  left: size.width * .25,
                                  child: Text(
                                    '€ ${controller.categoryProductList[index].price}',
                                    style: TextStyle(
                                      fontSize: size.width * .045,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'semiBold',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
