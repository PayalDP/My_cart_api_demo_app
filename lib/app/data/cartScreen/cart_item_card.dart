import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:my_cart/main.dart';

import '../../modules/cart_screen/controllers/cart_screen_controller.dart';

class CarItemCard extends StatelessWidget {
  const CarItemCard({
    super.key,
    required this.controller,
    required this.imageUrl,
    required this.productTitle,
    required this.price,
    required this.productDescription, required this.productID,
  });

  final CartScreenController controller;
  final String imageUrl;
  final String productTitle;
  final String productDescription;
  final double price;
  final int productID;

  @override
  Widget build(BuildContext context) {
    final RxInt quantityNumber = 1.obs;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * .005),
      child: Container(
        padding: EdgeInsets.all(size.width * .03),
        decoration: BoxDecoration(
            color: const Color(0xffffffff).withOpacity(0.602),
            borderRadius: BorderRadius.circular(size.width * .02),
            border:
                Border.all(color: const Color(0xff000000).withOpacity(0.102))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Product Image
            SizedBox(width: size.width * .25, child: Image.network(imageUrl)),

            Padding(
              padding: EdgeInsets.only(left: size.width * .03),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Product title
                  SizedBox(
                    width: size.width * .55,
                    child: Text(
                      productTitle,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          fontFamily: 'medium',
                          fontSize: size.width * .04,
                          fontWeight: FontWeight.w500,
                          height: size.height * .0015),
                    ),
                  ),

                  //Product Description
                  // Padding(
                  //   padding: EdgeInsets.only(top: size.height* .01),
                  //   child: SizedBox(
                  //     width: size.width* .55,
                  //     child: RichText(
                  //       softWrap: true,
                  //       overflow: TextOverflow.fade,
                  //       maxLines: 2,
                  //       text: TextSpan(
                  //           text: 'Description: ',
                  //           style: TextStyle(
                  //             fontFamily: 'medium',
                  //             fontSize: size.width * .04,
                  //             fontWeight: FontWeight.w500,
                  //             height: size.height* .0015,
                  //             color: const Color(0xff000000),
                  //           ),
                  //           children: [
                  //             TextSpan(
                  //               text: productDescription,
                  //               style: TextStyle(
                  //                 fontFamily: 'regular',
                  //                 fontSize: size.width * .038,
                  //                 fontWeight: FontWeight.w500,
                  //                 height: size.height* .0015,
                  //                 color: const Color(0xff000000).withOpacity(0.502),
                  //               ),
                  //             )
                  //           ]
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  //price

                  Padding(
                    padding: EdgeInsets.only(top: size.height * .01),
                    child: RichText(
                      text: TextSpan(
                          text: 'Price: ',
                          style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: size.width * .04,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff000000)),
                          children: [
                            TextSpan(
                                text: '${price}',
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: size.width * .037,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff000000)
                                      .withOpacity(0.502),
                                ))
                          ]),
                    ),
                  ),

                  //quantity Box
                  Padding(
                    padding: EdgeInsets.only(top: size.height * .01),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: size.height * .05,
                          width: size.width * .25,
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: const Color(0xfff51929), width: 1.5)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // remove item button
                              SizedBox(
                                width: size.width * .09,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    size: size.width * .04,
                                  ),
                                  onPressed: () {
                                    controller.removeItemQuantity(
                                        quantityNumber.value);
                                  },
                                ),
                              ),

                              //quantity count
                              Obx(
                                () => Text(
                                  quantityNumber.value.toString(),
                                  style: TextStyle(
                                    fontFamily: 'medium',
                                    fontSize: size.width * .03,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xfff51929),
                                  ),
                                ),
                              ),

                              //add button
                              SizedBox(
                                width: size.width * .09,
                                child: IconButton(
                                  onPressed: () {
                                    controller
                                        .addItemQuantity(quantityNumber.value);
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: size.width * .04,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //remove from cart item button
                        Padding(
                          padding: EdgeInsets.only(left: size.width* .02),
                          child: Container(
                            height: size.height * .05,
                            width: size.width * .25,
                            padding: const EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: const Color(0xfff51929), width: 1.5),
                            ),
                            child: TextButton(
                              onPressed: () {
                                controller.removeItem(productID);
                              },
                              child: Text(
                                'Remove',
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: size.width * .03,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xfff51929),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
