import 'package:flutter/material.dart';

class CategoriesAndButtonRow extends StatelessWidget {
  const CategoriesAndButtonRow({
    super.key,
    required this.categoryName,
    // required this.button,
  });

  final String categoryName;
  // final Widget button;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Categories Text
        Text(
          categoryName,
          style: const TextStyle(
              fontSize: 20,
              fontFamily: 'semiBold',
              fontWeight: FontWeight.w600,
              color: Color(0xff000000)),
        ),

        //Filter Button
        // button,
      ],
    );
  }
}