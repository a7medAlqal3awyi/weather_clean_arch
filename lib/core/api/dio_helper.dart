import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api_contant.dart';

class DioHelper {
  final Dio dio;

  DioHelper(this.dio);

  Future<Map<String, dynamic>> getWeatherData(String city) async {
    try {
      final response = await dio
          .get('${ApiConstants.baseUrl}/forecast.json', queryParameters: {
        'key': 'f674a61e0daa42728f9154329231103',
        'q': city,
        'days': '7',
      });
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        return response.data;
      } else {
        debugPrint('Error ${response.statusCode}');
        throw Exception("Error Exception ${response.statusCode}");
      }
    } catch (error) {
      debugPrint("$error");
      throw Exception("Error $error");
    }
  }
}
