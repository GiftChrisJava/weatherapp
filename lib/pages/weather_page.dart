// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:register/models/weather_model.dart';
import 'package:register/pages/fiveday_forecast.dart';
import 'package:register/services/weather_service.dart';
import 'package:register/widgets/drawer/drawer_manager.dart';
import 'package:register/widgets/drawer/k_drawer.dart';

class weatherPage extends StatefulWidget {
  const weatherPage({super.key});

  @override
  State<weatherPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<weatherPage> {
  // api key
  final _weatherService = WeatherService("c61d1bf8f97db4398fc103b6e040e97a");
  Weather? _weather;

  // fetch weather
  _fetchWeather() async {
    // get current city
    String cityName = await _weatherService.getCurrentCity();

    // get weather for city
    try {
      final weather = await _weatherService.getWeather(cityName);

      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  // weather animations
  String getWeatherAnimations(String? mainCondition) {
    if (mainCondition == null) return "assets/sunny.json";

    switch (mainCondition.toLowerCase()) {
      case "clouds":
      case "mist":
      case "smoke":
      case "haze":
      case "dust":
      case "fog":
        return "assets/cloudy.json";
      case "rain":
      case "drizzle":
      case "shower rain":
        return "assets/rainy.json";
      case "thunderstorm":
        return "assets/thunder.json";
      case "clear":
        return "assets/sunny.json";

      default:
        return "assets/sunny.json";
    }
  }

  // Additional method to generate a weather advice message
  String getWeatherAdvice() {
    if (_weather == null) return 'Fetching weather data...';

    // Define thresholds for heavy conditions
    const double heavyRainThreshold = 5.0; // in mm
    const double heavyWindThreshold = 25.0; // in m/s
    const double highTemperatureThreshold = 30.0; // in °C

    // Check for heavy rain
    if (_weather!.mainCondition.toLowerCase().contains("rain") &&
        _weather!.rainVolume! > heavyRainThreshold) {
      return 'Heavy rain expected. Remember to carry an umbrella!';
    }

    // Check for heavy wind
    if (_weather!.windSpeed > heavyWindThreshold) {
      return 'Strong winds today. Secure loose items outdoors!';
    }

    // Check for high temperature
    if (_weather!.temperature > highTemperatureThreshold) {
      return 'High temperatures today. Stay hydrated and avoid prolonged sun exposure!';
    }

    // If all conditions are normal
    return 'According to the weather today,the weather conditions are normal';
  }

  // init state
  @override
  void initState() {
    super.initState();

    // fetch weather on startup
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: DrawerManager.drawerKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF2B4A54),
        title: Text(
          "Today's weather - Zanyengo Za lero",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[300]),
        ),
        centerTitle: true,
      ),
      body: _body(context),
      drawer: KDrawer(),
    );
  }

  Center _body(BuildContext context) {
    return Center(
      child: _weather == null
          ? CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_weather!.cityName,
                    style: TextStyle(fontSize: 24, color: Colors.grey[700])),
                Lottie.asset(getWeatherAnimations(_weather?.mainCondition)),
                Text("${_weather!.temperature.round()}°C",
                    style: TextStyle(fontSize: 20, color: Colors.orange[300])),
                Text(_weather!.mainCondition,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700])),
                Text("Wind Speed: ${_weather!.windSpeed} m/s",
                    style: TextStyle(fontSize: 20, color: Colors.grey[700])),
                Text("Humidity: ${_weather!.humidity}%",
                    style: TextStyle(fontSize: 20, color: Colors.grey[700])),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    getWeatherAdvice(),
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2B4A54)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    // Navigate to AuthPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeatherForecastPage(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(17),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Color(0xFF2B4A54),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        "See More / Onani Zambiri",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
