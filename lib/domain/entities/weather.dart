import 'package:equatable/equatable.dart';

class Weather  extends Equatable {
  final String name;
  final String country;
  final String text;
  final String date;
  final double maxTemp;
  final double minTemp;
  final double avgTemp;
  final String sunrise;
  final String sunset;

  const Weather({
    required this.name,
    required this.country,
    required this.text,
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.avgTemp,
    required this.sunrise,
    required this.sunset,
  });

  @override
  List<Object?> get props => [
    name,
    country,
    text,
    date,
    maxTemp,
    minTemp,
    avgTemp,
    sunrise,
    sunset,
  ];
}
