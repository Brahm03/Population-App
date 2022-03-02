import 'package:appexample/widgets/mytext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class APPbar {
  static MYappbar({required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText(text: text),
      ],
    );
  }
}
