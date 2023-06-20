import 'package:flutter/material.dart';

class ScreenSize{
  getWidth<double>(context){
    final width = MediaQuery.of(context).size.width;
    return width;
  }
  getHeight<double>(context){
    final height = MediaQuery.of(context).size.height;
    return height;
  }
}