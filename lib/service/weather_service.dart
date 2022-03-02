import 'dart:convert';

import 'package:appexample/core/constants/api/weather_apiConst.dart';
import 'package:appexample/models/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class WeatherService {
  static Future<WeatherModel> getWeather() async {
    Response res = await Dio().get(WeatherApi.weatherApi);
    return WeatherModel.fromJson(jsonDecode(res.data));
  }
}
