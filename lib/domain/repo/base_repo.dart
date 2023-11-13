import 'package:dartz/dartz.dart';
import 'package:weather_clean_arch/core/error/failure.dart';
import 'package:weather_clean_arch/domain/entities/weather.dart';

abstract class BaseWeatherRepository {
  Future<Either<Failure,Weather>>getWeatherByCity(String city);
}
