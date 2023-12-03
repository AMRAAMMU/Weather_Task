// lib/bloc/weather_bloc.dart

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../domain/models/weather_model.dart';
import '../domain/usecases/get_weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeather getWeather;

  WeatherBloc(this.getWeather) : super(WeatherInitial()) {
    on<GetWeatherEvent>((event, emit) async {
      emit(WeatherLoading());
      try {
        final weather = await getWeather(cityName: event.cityName);
        emit(WeatherLoaded(weather: weather, fiveDayForecast: []));
      } catch (e) {
        emit(WeatherError(message: 'Failed to get weather data'));
      }
    });
  }
}