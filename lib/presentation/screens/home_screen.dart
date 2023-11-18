import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_clean_arch/presentation/controller/weather/weather_cubit.dart';
import 'package:weather_clean_arch/presentation/controller/weather/weather_state.dart';
import 'package:weather_clean_arch/injection.dart' as di;

class HomeScreen extends StatelessWidget {
  final  String city ;


  const HomeScreen({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: BlocProvider(
        create: (context) => di.sl<WeatherCubit>()..getWeatherByCityData(city),
        child: BlocBuilder<WeatherCubit,WeatherState>(
          builder: (context,state) {
            if (state is LoadingWeatherState ){
              return const Center(child: CircularProgressIndicator());
            }
            else if (state is SuccessWeatherState ){
           return   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(
                        flex: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.weather.country.toString(),
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            state.weather.name.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                       const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'updated at: ${state.weather.date}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Image.asset(.getImage()),
                          Text('${state.weather.avgTemp.toInt()}°C',
                              style: const TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold)),
                          Column(
                            children: [
                              Text('max: ${state.weather.maxTemp.toInt()}°C'),
                              const SizedBox(
                                height: 10,
                              ),
                              Text('min: ${state.weather.minTemp.toInt()}°C'),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      Text(
                    state.weather.text.toString(),
                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'sunrise:${state.weather.sunrise}',
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'sunset:${state.weather.sunset}',
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(
                        flex: 5,
                      ),
                    ],
            ) ;

            }
            else if (state is FailureWeatherState){
              return const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text('Enter valid city ',style: TextStyle(fontSize: 30,color: Colors.white ),)),
                ],
              );
            }
            return const CircularProgressIndicator();
          },
        )
      ),
    );
  }
}
