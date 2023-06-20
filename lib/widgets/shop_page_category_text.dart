import 'package:flutter/material.dart';

import '../static/static_colors.dart';
import '../static/static_fonts.dart';

class ShopPageCategoryText extends StatelessWidget {
  final String text;
  final VoidCallback callBack;
  const ShopPageCategoryText({
    super.key, required this.text, required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Boldtext(size: 24, text: text, textColor: Pallete.textDarkColor),
          GestureDetector(
            onTap: callBack,
            child: const Regulartext(size: 15, text: 'See All', textColor: Pallete.mainColor)
          ),
        ],
      ),
    );
  }
}
