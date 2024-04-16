// New class to represent each data point in the forecastclass
class WeatherDataPoint {
  final double temperature;
  final String mainCondition;
  final double windSpeed;
  final int humidity;
  final double? rainVolume;
  final String dateTime;

  WeatherDataPoint({
    required this.temperature,
    required this.mainCondition,
    required this.windSpeed,
    required this.humidity,
    this.rainVolume,
    required this.dateTime,
  });

  factory WeatherDataPoint.fromJson(Map<String, dynamic> json) {
    double? parsedRainVolume;
    // The OpenWeatherMap API uses 'rain' object with '3h' key for 3-hour rain volume
    if (json.containsKey('rain')) {
      parsedRainVolume = json['rain']['3h']?.toDouble();
    }

    // The 'weather' array may contain more than one item, ensure to handle it properly
    String mainCondition = 'Not available';
    if (json['weather'] != null && json['weather'].isNotEmpty) {
      mainCondition = json['weather'][0]['main'];
    }

    return WeatherDataPoint(
      temperature: json["main"]["temp"].toDouble(),
      mainCondition: mainCondition,
      windSpeed: json["wind"]["speed"].toDouble(),
      humidity: json["main"]["humidity"].toInt(),
      rainVolume: parsedRainVolume,
      dateTime: json["dt_txt"],
    );
  }
}
