// lib/ui/widgets/weather_card.dart

import 'package:flutter/material.dart';
import '../../domain/models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;
  final String cityName; // Add this property

  WeatherCard({required this.weather, required this.cityName}); // Update the constructor

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.brown.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'City: $cityName', // Display the entered city name
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.orangeAccent.shade100),
            ),
            SizedBox(height: 8),
            Text(
              '${weather.temperature}°C',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.orangeAccent.shade100),
            ),
            SizedBox(height: 8),
            Text(
              weather.description,
              style: TextStyle(fontSize: 30, color: Colors.orangeAccent.shade100),
            ),
            SizedBox(height: 8),
            Image.network(
              'https://openweathermap.org/img/w/${weather.icon}.png',
              width: 65,
              height: 65,
            ),
          ],
        ),
      ),
    );
  }
}
