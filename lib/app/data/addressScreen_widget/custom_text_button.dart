import 'package:flutter/material.dart';

import '../../../../main.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key, required this.buttonName, required this.onPressed,
  });

  final String buttonName;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(6),
          ),
        ),
        side: MaterialStatePropertyAll(
          BorderSide(
              color: const Color(0xfff51929),
              width: size.width * .005),
        ),
        fixedSize: MaterialStatePropertyAll(Size.fromWidth(size.width* .455),),
      ),
      onPressed: onPressed(),
      child: Text(
        buttonName.toUpperCase(),
        style: const TextStyle(fontSize: 15, fontFamily: 'semiBold', color: Color(0xfff51929), fontWeight: FontWeight.w600, ),
      ),
    );
  }
}



