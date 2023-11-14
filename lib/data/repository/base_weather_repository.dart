import 'package:dartz/dartz.dart';
import 'package:weather_clean_arch/core/error/failure.dart';
import 'package:weather_clean_arch/data/data_source/weather_remote_data_source.dart';
import 'package:weather_clean_arch/domain/repo/base_repo.dart';

import '../../domain/entities/weather.dart';

 class WeatherRopository implements BaseWeatherRepository{
  WeatherRemoteDataSource remoteDataSource;

  WeatherRopository(this.remoteDataSource);


  @override
  Future<Either<Failure, Weather>> getWeatherByCity(String city)async{
    final result = await remoteDataSource.getWeatherByCity(city);
try{
  return  Right(result as Weather);
} on Exception catch(err){
  return Left(err.toString() as Failure);
}
  }
}
