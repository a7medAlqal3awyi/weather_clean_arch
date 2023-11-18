import 'package:equatable/equatable.dart';
import 'package:weather_clean_arch/domain/entities/weather.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialWeatherState extends WeatherState {}

class LoadingWeatherState extends WeatherState {}

class SuccessWeatherState extends WeatherState {
  final Weather weather;

  SuccessWeatherState({required this.weather});
}

class FailureWeatherState extends WeatherState {
  final String error;

  FailureWeatherState({required this.error});
}
