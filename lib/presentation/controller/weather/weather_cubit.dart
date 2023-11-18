import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_clean_arch/core/error/failure.dart';
import 'package:weather_clean_arch/domain/entities/weather.dart';
import 'package:weather_clean_arch/domain/use_case/get_weather_use_case_by_city.dart';

import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {

  WeatherCubit({required this.weatherByCityUseCase})
      : super(InitialWeatherState());
  GetWeatherByCityUseCase weatherByCityUseCase;

  static WeatherCubit get(context) => BlocProvider.of(context);

  Future<void> getWeatherByCityData(String city) async {
    try {
      emit(LoadingWeatherState());
      Either<Failure, Weather> weatherByCityData =
          await weatherByCityUseCase.call(city);
      emit(
        weatherByCityData.fold(
          (failur) => FailureWeatherState(error: failur.toString()),
          (weather) => SuccessWeatherState(weather: weather),
        ),
      );
    } catch (err) {
      FailureWeatherState(error: err.toString());
    }
  }

// MaterialColor getThemeColor() {
//   if (weatherStateName == 'Clear' ||
//       weatherStateName == 'Light cloud' ||
//       weatherStateName == 'Sunny') {
//     return Colors.orange;
//   } else if (weatherStateName == 'Snow' ||
//       weatherStateName == 'Steel' ||
//       weatherStateName == 'Hail' ||
//       weatherStateName == 'Moderate snow') {
//     return Colors.blueGrey;
//   } else if (weatherStateName == 'Partly cloudy' ||
//       weatherStateName == 'Heavy cloudy' ||
//       weatherStateName == 'Overcast') {
//     return Colors.blue;
//   } else if (weatherStateName == 'Patchy rain possible' ||
//       weatherStateName == 'Moderate rain' ||
//       weatherStateName == 'Heavy rain') {
//     return Colors.lightBlue;
//   } else if (weatherStateName == 'Thunderstorm' ||
//       weatherStateName == 'Thunder') {
//     return Colors.grey;
//   }
//   return Colors.lime;
// }
}
