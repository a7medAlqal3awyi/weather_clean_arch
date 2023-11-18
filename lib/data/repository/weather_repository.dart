import 'package:dartz/dartz.dart';
import 'package:weather_clean_arch/core/error/failure.dart';
import 'package:weather_clean_arch/data/data_source/weather_remote_data_source.dart';
import 'package:weather_clean_arch/domain/repo/base_repo.dart';

import '../../domain/entities/weather.dart';

class WeatherRopository implements BaseWeatherRepository {
  BaseWeatherRemoteDataSource baseRemoteDataSource;

  WeatherRopository({required this.baseRemoteDataSource});

  @override
  Future<Either<Failure, Weather>> getWeatherByCity(String city) async {
    try {
      final result = await baseRemoteDataSource.getWeatherByCity(city);
      return Right(result);
    } on Exception catch (err) {
      return Left(err.toString() as Failure);
    }
  }
}
