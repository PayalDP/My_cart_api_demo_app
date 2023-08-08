import 'package:flutter/material.dart';

import '../../../../main.dart';

class BillDetailItemCard extends StatelessWidget {
  const BillDetailItemCard({
    super.key, required this.price, required this.itemTitle,
  });

  final String itemTitle;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          //Total item
          Text(
            itemTitle,
            style: TextStyle(
                fontFamily: 'medium',
                fontSize: size.width * .04,
                color: const Color(0xff000000).withOpacity(0.502),
                fontWeight: FontWeight.w500),
          ),

          //price
          Text('€$price', style: TextStyle(fontFamily: 'medium',fontSize: size.width * .04,fontWeight: FontWeight.w500,),)
        ]);
  }
}