
import 'package:flutter/material.dart';

import '../../../../main.dart';

class PopularItemCard extends StatelessWidget {
  const PopularItemCard({
    super.key,
    required this.productTitle,
    required this.price,
    required this.rate,
    required this.productImageUrl, required this.reviews,
  });

  final String productImageUrl;
  final String productTitle;
  final double price;
  final double rate;
  final int reviews;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Padding(
        padding: EdgeInsets.only(right: size.width* .03, bottom: size.height* .01),
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
                  height: size.height* .15,
                  width: size.width * .22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Color(0xff000000).withOpacity(0.102)),
                    image: DecorationImage(
                        image: NetworkImage(productImageUrl),
                        fit: BoxFit.cover),
                  ),
                ),
              ),

              //Product Title
              Positioned(
                left: size.width * .25,
                right: size.width* .01,
                child: Text(
                  productTitle,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: size.width* .04,
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
                  color: const Color(0xff909090).withOpacity(0.200),
                ),
              ),

              //Prices
              Positioned(
                left: size.width * .25,
                top: size.height * .08,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    //rate
                    Text(
                      '$rate',
                      style: TextStyle(
                        fontSize: size.width* .04,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'regular',
                        color: const Color(0xff000000).withOpacity(0.502)
                      ),
                    ),

                    SizedBox(
                      width: size.width * .005,
                    ),

                    //ratting icon
                    SizedBox(
                        height: size.height* .017,
                        child: Image.asset('images/ratting_icon.png',fit: BoxFit.cover,)),

                    SizedBox(
                      width: size.width * .02,
                    ),

                    //reviews
                    Text(
                      '$reviews Reviews',
                      style: TextStyle(
                          fontSize: size.width* .04,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'regular',
                          color: const Color(0xff000000).withOpacity(0.502)
                      ),
                    ),

                  ],
                ),
              ),

              //Price
              Positioned(
                top: size.height* .11,
                left: size.width * .25,
                child: Text(
                '€ $price',
                style: TextStyle(
                  fontSize: size.width* .045,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'semiBold',
                ),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
