import 'package:appexample/models/weather_model.dart';
import 'package:appexample/widgets/mytext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeatherPage extends StatelessWidget {
  WeatherModel weatherModel;
  WeatherPage({required this.weatherModel,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: ListView.builder(itemBuilder: (_, __) {
        return ListTile(
          title: MyText(text: weatherModel.dataseries![__].wind10M!.direction.toString()),
        );
      }),
    );
  }
}
