// lib/bloc/weather_state.dart

part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weather;
  final List<WeatherModel> fiveDayForecast;

  WeatherLoaded({required this.weather, required this.fiveDayForecast});

  @override
  List<Object?> get props => [weather, fiveDayForecast];
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError({required this.message});

  @override
  List<Object?> get props => [message];
}