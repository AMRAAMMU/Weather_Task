// // lib/ui/widgets/forecast_list.dart
//
// import 'package:flutter/material.dart';
// import '../../domain/models/weather_model.dart';
// import 'forecast_card.dart'; // Import the ForecastCard widget
//
// class ForecastList extends StatelessWidget {
//   final List<WeatherModel> forecast;
//
//   ForecastList({required this.forecast});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           '5-Day Weather Forecast',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orangeAccent.shade100),
//         ),
//         SizedBox(height: 8),
//         // Display the 5-day forecast
//         for (var dayWeather in forecast)
//           ForecastCard(dayWeather: dayWeather),
//       ],
//     );
//   }
// }
