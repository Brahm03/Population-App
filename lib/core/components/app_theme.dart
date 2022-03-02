import 'package:appexample/core/constants/colorconst.dart';
import 'package:flutter/material.dart';

class APPTHEME {
  static ThemeData ligth = ThemeData(
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: ColorConst.KPrimaryColor,
    )
  );
  static ThemeData dark = ThemeData(
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: ColorConst.KPrimaryColor,
    )
  );
}