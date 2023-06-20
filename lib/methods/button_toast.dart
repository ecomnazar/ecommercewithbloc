import 'package:finalapp/static/static_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonToast{
  onPressMiniButton(context, text, color){
  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     duration: Duration(milliseconds: 700),
  //     backgroundColor: Pallete.mainColor,
  //     content: Text("Sebede goşuldy"),
  //   ));
  Fluttertoast.showToast(
    msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0,
        backgroundColor: color
  );
}
}