import 'package:appexample/core/constants/fontsizeconst.dart';
import 'package:appexample/core/constants/radiusconst.dart';
import 'package:appexample/models/population_model.dart';
import 'package:appexample/widgets/mytext.dart';
import 'package:flutter/material.dart';

class Year_info extends StatelessWidget {
  Color color;
  var pop;
  var year;
  Year_info({required this.color,required this.pop, required this.year, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      radius: Radius_const.KMediumRadius,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(text: year == null ? 'no data' : year.toString(), size: FontConst.KSmallFont,),
          MyText(text: pop == null ? 'no data' : '$pop mln', size: FontConst.KExtraSmallFont,),
        ],
      ),
    );
  }
}
