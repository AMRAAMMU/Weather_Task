// lib/domain/models/weather_model.dart

class WeatherModel {
  final String cityName;
  final double temperature;
  final String description;
  final String icon;
  final String day; // Add this property for the day

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.icon,
    required this.day,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: json['main']['temp'].toDouble(),
      // feelsLike: json['main']['feels_like'].toDouble(),
      // sunset: _formatSunsetTime(json['sys']['sunset']),
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'], cityName: '', day: '',
    );
  }



  static String _formatSunsetTime(int sunsetTimestamp) {
    DateTime sunsetTime = DateTime.fromMillisecondsSinceEpoch(sunsetTimestamp * 1000);
    return '${sunsetTime.hour}:${sunsetTime.minute}';
  }
}

