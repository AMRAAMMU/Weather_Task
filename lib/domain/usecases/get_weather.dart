// lib/domain/usecases/get_weather.dart



import '../../data/weather_repository.dart';
import '../models/weather_model.dart';

class GetWeather {
  final WeatherRepository repository;

  GetWeather({required this.repository});

  Future<WeatherModel> call({required String cityName}) async {
    return await repository.getWeather(cityName);
  }
}