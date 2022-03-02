import 'package:flutter/material.dart';

import '../core/constants/colorconst.dart';
import '../core/constants/fontsizeconst.dart';

class MyText extends StatelessWidget {
  String text;
  final double size;
  final Color color;
  MyText({this.color = Colors.black,this.size = FontConst.KMediumFont,required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color, fontSize: size),
    );
  }
}
