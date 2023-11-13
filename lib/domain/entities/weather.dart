class Weather  extends Equitable {
  final String name;
  final String region;
  final double temp;
  final String text;
  final String date;
  final double maxTemp;
  final double minTemp;
  final double avgTemp;
  final String sunrise;
  final String sunset;

  Weather({
    required this.name,
    required this.region,
    required this.temp,
    required this.text,
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.avgTemp,
    required this.sunrise,
    required this.sunset,
  });
}
