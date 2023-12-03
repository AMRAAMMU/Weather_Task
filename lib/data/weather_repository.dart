// lib/data/weather_repository.dart

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../domain/models/weather_model.dart';

class WeatherRepository {
  final String apiKey;
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  WeatherRepository({required this.apiKey});

  Future<WeatherModel> getWeather(String cityName) async {
    final response = await http.get(Uri.parse('$baseUrl?q=$cityName&appid=$apiKey'));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

