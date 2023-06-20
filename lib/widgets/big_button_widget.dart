import 'package:finalapp/static/screen_size.dart';
import 'package:flutter/material.dart';

import '../static/static_colors.dart';
import '../static/static_fonts.dart';

class BigButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback callBack;
  const BigButtonWidget({
    super.key, required this.buttonText, required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: SizedBox(
          width: ScreenSize().getWidth(context),
          height: 65,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Pallete.mainColor,
                borderRadius: BorderRadius.circular(15)),
            child: Regulartext(
                size: 18, text: buttonText, textColor: Pallete.whiteColor),
          )),
    );
  }
}
