import 'dart:convert';

import 'package:appexample/core/constants/api/population_apiConst.dart';
import 'package:appexample/models/population_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PopulationService {
  static Future<PopulationModel> getPopulation() async {
    Response res = await Dio().get(PopulationAPi.populatinApi);
    return PopulationModel.fromJson(res.data);
  }
}
