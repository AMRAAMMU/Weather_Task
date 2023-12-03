// lib/ui/widgets/forecast_card.dart

import 'package:flutter/material.dart';
import '../../domain/models/weather_model.dart';

class ForecastCard extends StatelessWidget {
  final List<WeatherModel> forecast;

  ForecastCard({required this.forecast});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.brown.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '5-Day Weather Forecast',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orangeAccent.shade100),
            ),
            SizedBox(height: 8),
            // Display the 5-day forecast
            for (var dayWeather in forecast)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Day: ${dayWeather.day}', // Adjust this based on your WeatherModel
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.orangeAccent.shade100),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${dayWeather.temperature}°C - ${dayWeather.description}',
                    style: TextStyle(fontSize: 14, color: Colors.orangeAccent.shade100),
                  ),
                  SizedBox(height: 8),
                ],
              ),
          ],
        ),
      ),
    );
  }
}