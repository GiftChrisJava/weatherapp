class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final double windSpeed;
  final int humidity;
  final double?
      rainVolume; // Optional property to handle cases where rain data might not be available

  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.windSpeed,
    required this.humidity,
    this.rainVolume,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    double? parsedRainVolume;
    // Check if 'rain' data is available and parse it
    if (json.containsKey('rain') && json['rain'] is Map) {
      parsedRainVolume = (json['rain']['1h'] ?? json['rain']['3h'])?.toDouble();
    }
    return Weather(
      cityName: json["name"],
      temperature: json["main"]["temp"].toDouble(),
      mainCondition: json["weather"][0]['main'],
      windSpeed: json["wind"]["speed"].toDouble(),
      humidity: json["main"]["humidity"].toInt(),
      rainVolume: parsedRainVolume,
    );
  }
}
