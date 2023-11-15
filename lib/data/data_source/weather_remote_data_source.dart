import 'package:weather_clean_arch/core/api/dio_helper.dart';

import '../models/weather_model.dart';

abstract class BaseWeatherRemoteDataSource {
  Future<WeatherModel> getWeatherByCity(String city);
}

class WeatherRemoteDataSource implements BaseWeatherRemoteDataSource {
  DioHelper  dio;

  WeatherRemoteDataSource(this.dio);

  @override
  Future<WeatherModel> getWeatherByCity(String city) async {
 var response =  await dio.getWeatherData(city);
 return WeatherModel.fromJSON(response);
  }

}
