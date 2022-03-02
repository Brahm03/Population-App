import 'package:appexample/core/constants/colorconst.dart';
import 'package:appexample/core/constants/iconconst.dart';
import 'package:appexample/core/constants/pm_const.dart';
import 'package:appexample/core/constants/radiusconst.dart';
import 'package:appexample/models/population_model.dart';
import 'package:appexample/widgets/dropdowns.dart';
import 'package:appexample/widgets/mytext.dart';
import 'package:appexample/widgets/year_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Popluation_page extends StatefulWidget {
  PopulationModel datum;

  Popluation_page({required this.datum, Key? key}) : super(key: key);

  @override
  State<Popluation_page> createState() => _Popluation_pageState();
}

class _Popluation_pageState extends State<Popluation_page> {
  int year = 2013;
  TextEditingController _searchControler = TextEditingController();
  List<Color> colors = [
    Colors.green,
    Colors.blueGrey,
    Colors.tealAccent,
    Colors.yellowAccent,
    Colors.brown,
    Colors.orangeAccent,
    Colors.pinkAccent
  ];
  Set<Datum> searchedITems = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PM_const.KMediumPM,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                DropdownButton(
                    value: year,
                    dropdownColor: ColorConst.KPrimaryColor,
                    borderRadius:
                        BorderRadius.circular(Radius_const.KMediumRadius),
                    onTap: () {},
                    items: List.generate(
                        widget.datum.data!.length,
                        (index) => DropdownMenuItem(
                            value: widget.datum.data![index].idYear,
                            child: MyText(
                                text: widget.datum.data![index].idYear
                                    .toString()))),
                    onChanged: (v) {
                      year = v as int;
                      setState(() {});
                    }),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CupertinoSearchTextField(
            controller: _searchControler,
            onChanged: (text) {
              searchedITems.clear();
              for (Datum item in widget.datum.data as List) {
                if (text.length == 0) {
                  searchedITems.clear();
                  setState(() {});
                } else if (item.idYear.toString().contains(text.toString())) {
                  searchedITems.add(item);
                  setState(() {});
                }
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              flex: 10,
              child: GridView.builder(
                  itemCount: searchedITems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 0,
                      mainAxisExtent: 120,
                      crossAxisCount: 2),
                  itemBuilder: (_, __) {
                    return Year_info(
                        color: colors[__],
                        pop: searchedITems.toList()[__].population,
                        year: searchedITems.toList()[__].idYear);
                  }))
        ],
      ),
    );
  }
}
