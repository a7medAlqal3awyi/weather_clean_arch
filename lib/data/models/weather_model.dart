import 'package:weather_clean_arch/domain/entities/weather.dart';

class WeatherModel extends Weather {
  const WeatherModel({
    required super.name,
    required super.country,
    required super.text,
    required super.date,
    required super.maxTemp,
    required super.minTemp,
    required super.avgTemp,
    required super.sunrise,
    required super.sunset,
  });

  factory WeatherModel.fromJSON(Map<String, dynamic> data) {
    var json = data["forecast"]["forecastday"][0];
    return WeatherModel(
      name: data["location"]["name"],
      country: data["location"]["country"],
      date: data["location"]["localtime"],
      text: json["day"]["condition"]["text"],
      maxTemp: json["day"]["maxtemp_c"],
      minTemp: json["day"]["mintemp_c"],
      avgTemp: json["day"]["avgtemp_c"],
      sunrise: data["forecast"]["forecastday"][1]["astro"]["sunrise"],
      sunset: data["forecast"]["forecastday"][1]["astro"]["sunset"],
    );
  }
}
