import 'package:appexample/models/weather_model.dart';
import 'package:appexample/screens/main_page.dart';
import 'package:appexample/screens/weacher_page/weather_page.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case '/main':
        return MaterialPageRoute(builder: (_) => const Mainpage());
      case '/weather':
        return MaterialPageRoute(builder: (_) => WeatherPage(weatherModel: args as WeatherModel,));  
    }
  }
}
