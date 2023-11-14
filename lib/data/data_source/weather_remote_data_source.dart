import 'dart:convert';

import 'package:weather_clean_arch/core/api/api_contant.dart';

import '../models/weather_model.dart';
import 'package:dio/dio.dart';

abstract class BaseWeatherRemoteDataSource {
  Future<WeatherModel?>getWeatherByCity(String city);
}

class WeatherRemoteDataSource implements BaseWeatherRemoteDataSource{
  @override
  Future<WeatherModel?> getWeatherByCity(String city) async {
    try {
      final dio = Dio();
      var response = await dio.get(
          "${ApiConstants.baseUrl}key=${ApiConstants.appKey}&q=$city&days=7");
      print(response);
      return WeatherModel.fromJSON(json.decode(response.data));
    }
    catch (e) {
      print(e.toString());
    }
    return null;
  }
}