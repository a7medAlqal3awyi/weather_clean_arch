import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_clean_arch/data/data_source/weather_remote_data_source.dart';
import 'package:weather_clean_arch/domain/use_case/get_weather_use_case_by_city.dart';
import 'package:weather_clean_arch/presentation/controller/weather/weather_cubit.dart';

import 'core/api/dio_helper.dart';
import 'data/repository/weather_repository.dart';

final sl = GetIt.instance;

Future <void> init() async {
  /// Cubit
  sl.registerFactory<WeatherCubit>(
      () => WeatherCubit(weatherByCityUseCase: sl()));

  /// Use case
  sl.registerLazySingleton<GetWeatherByCityUseCase>(
      () => GetWeatherByCityUseCase(baseWeatherRepository: sl()));

  /// Repo
  sl.registerLazySingleton<WeatherRopository>(
      () => WeatherRopository(baseRemoteDataSource: sl()));

  /// Data source
  sl.registerLazySingleton<BaseWeatherRemoteDataSource>(
      () => WeatherRemoteDataSource(dio: sl()));

  //Dio
  sl.registerLazySingleton(() => DioHelper(sl()));
  sl.registerLazySingleton(() => Dio());
}
