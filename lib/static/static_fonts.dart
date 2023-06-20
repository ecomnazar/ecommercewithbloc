import 'package:flutter/material.dart';

class Boldtext extends StatelessWidget {
  final double size;
  final String? text;
  final Color textColor;
  final textAlign;
  final oneLine;
  const Boldtext({
    super.key, required this.size, required this.text, required this.textColor, this.textAlign = false, this.oneLine = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text!, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: size, overflow: TextOverflow.fade), maxLines: oneLine ? 1 : 3,  textAlign: textAlign ? TextAlign.center : TextAlign.left);
  }
}

class Regulartext extends StatelessWidget {
  final double size;
  final String text;
  final Color textColor;
  final textAlign;
  final oneLine;
  const Regulartext({
    super.key, required this.size, required this.text, required this.textColor, this.textAlign = false, this.oneLine = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: textColor, fontWeight: FontWeight.normal, fontSize: size,  overflow: TextOverflow.fade), maxLines: oneLine ? 1 : 3, textAlign: textAlign ? TextAlign.center : TextAlign.left);
  }
}