import 'package:finalapp/bloc/api/bloc/get_api_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../static/static_colors.dart';

class MiniButtonWidget extends StatelessWidget {
  final VoidCallback callBack;
  const MiniButtonWidget({
    super.key, required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        padding: EdgeInsets.all(11),
        decoration: BoxDecoration(
            color: Pallete.mainColor,
            borderRadius: BorderRadius.circular(10)),
        child: SvgPicture.asset('lib/images/plus.svg', width: 20),
      ),
    );
  }
}