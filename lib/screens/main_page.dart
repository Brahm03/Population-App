import 'package:appexample/core/constants/colorconst.dart';
import 'package:appexample/core/constants/fontsizeconst.dart';
import 'package:appexample/core/constants/iconconst.dart';
import 'package:appexample/core/constants/pm_const.dart';
import 'package:appexample/core/constants/radiusconst.dart';
import 'package:appexample/models/population_model.dart';
import 'package:appexample/models/weather_model.dart';
import 'package:appexample/screens/population_page/population_page.dart';
import 'package:appexample/screens/weacher_page/weather_page.dart';
import 'package:appexample/service/population_service.dart';
import 'package:appexample/service/weather_service.dart';
import 'package:appexample/widgets/appbar.dart';
import 'package:appexample/widgets/mybar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int currentPage = 0;
  List<String> type = ['Weather', 'Population'];
  List? pages;

  List<SvgPicture> icons = [
    IconConst.weather,
    IconConst.people,
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: ColorConst.KPrimaryColor,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          type: BottomNavigationBarType.shifting,
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
              debugPrint(value.toString());
            });
          },
          items: ItemBar.mybar,
        ),
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                    padding: EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(
                        color: ColorConst.KPrimaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.hashCode * 0.1,
                    child: APPbar.MYappbar(text: type[currentPage])),
              ),
              Expanded(
                flex: 10,
                child: FutureBuilder(
                    future: Future.wait([
                      WeatherService.getWeather(),
                      PopulationService.getPopulation(),
                    ]),
                    builder: (context, AsyncSnapshot snap) {
                      if (!snap.hasData) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      } else if (snap.hasError) {
                        return const Center(
                          child: Text('error'),
                        );
                      } else {
                        List pages = [
                          WeatherPage(weatherModel: snap.data[0]),
                          Popluation_page(datum: snap.data[1])
                        ];
                        return pages[currentPage];
                      }
                    }),
              )
            ],
          ),
        ));
  }
}
