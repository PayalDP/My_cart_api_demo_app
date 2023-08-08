
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../model/products.dart';

class TopCategoryItemCard extends StatelessWidget {
  const TopCategoryItemCard({
    super.key,
    required this.itemName,
    required this.itemImagePath, required this.category,
  });

  final String itemName;
  final String itemImagePath;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      },
      child: Padding(
        padding: EdgeInsets.only(right: size.width * .02),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //item Image
            Container(
              height: size.height * .25,
              width: size.width * .31,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    itemImagePath,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
            ),

            //item name
            Text(
              itemName,
              style: TextStyle(
                  fontSize: size.width* .035,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
