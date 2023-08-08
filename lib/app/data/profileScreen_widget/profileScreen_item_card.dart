import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';

class ProFileScreenItemCard extends StatelessWidget {
  const ProFileScreenItemCard({
    super.key, required this.itemName, required this.iconPath, required this.pagePath, required this.argument,
  });

  final String iconPath;
  final String itemName;
  final String pagePath;
  final dynamic argument;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () => Get.toNamed(pagePath, arguments: argument),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width* .01, vertical: size.height* .01),
        child: Card(
          elevation: 0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [

              Image.asset(iconPath),

          Padding(
                padding: EdgeInsets.only(left: size.width* .03),
                child: Text(
                  itemName,
                  style: TextStyle(
                    fontSize: size.width * .035,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff000000),
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