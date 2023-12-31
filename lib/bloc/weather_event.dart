// lib/bloc/weather_event.dart

part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class GetWeatherEvent extends WeatherEvent {
  final String cityName;

  GetWeatherEvent({required this.cityName, required double latitude, required double longitude});

  @override
  List<Object?> get props => [cityName];
}