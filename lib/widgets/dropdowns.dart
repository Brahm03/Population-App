import 'package:appexample/models/population_model.dart';
import 'package:appexample/service/population_service.dart';
import 'package:appexample/widgets/mytext.dart';
import 'package:flutter/material.dart';

class DropDowns {
  static dropDowns({required int length, required List<String> text}) {
    return List.generate(
        length, (index) => DropdownMenuItem(child: MyText(text: text[index])));
  }
}
