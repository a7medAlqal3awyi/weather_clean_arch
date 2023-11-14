import 'package:dartz/dartz.dart';
import 'package:weather_clean_arch/core/error/failure.dart';
import 'package:weather_clean_arch/core/usecase/base_use_case.dart';
import 'package:weather_clean_arch/domain/entities/weather.dart';

import '../repo/base_repo.dart';

class GetWeatherByCityUseCase implements BaseUseCase<Weather , String > {
  final BaseWeatherRepository baseWeatherRepository;

  GetWeatherByCityUseCase({required this.baseWeatherRepository});
  @override
  Future<Either<Failure, Weather>> call(String city) async {
    return await baseWeatherRepository.getWeatherByCity(city);
  }

}