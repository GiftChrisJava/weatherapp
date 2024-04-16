// ignore_for_file: unused_local_variable

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:register/models/forecast_model.dart';

class ForecastService {
  static const BASEURL = "https://api.openweathermap.org/data/2.5/forecast";
  final String apiKey;

  ForecastService(this.apiKey);

  Future<List<WeatherDataPoint>> getForecastByLocation() async {
    // Get current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Convert location to city name (optional)
    String cityName = await _getCityNameFromLocation(position);

    // Build the API request URL
    final url = Uri.parse(
        "$BASEURL?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric&cnt=40");

    // Fetch weather data
    final response = await http.get(url);

    print(cityName);

    print(url);

    print(response.body);
    switch (response.statusCode) {
      case 200:
        final data = jsonDecode(response.body);
        final forecasts = List<WeatherDataPoint>.from(
            data['list'].map((item) => WeatherDataPoint.fromJson(item)));
        return forecasts;
      case 401:
        throw Exception("Unauthorized - Check your API key");
      case 404:
        throw Exception("City not found");
      default:
        throw Exception(
            "Failed to load weather with status code: ${response.statusCode}");
    }
  }

  Future<String> _getCityNameFromLocation(Position position) async {
    // You can remove this function if you don't need the city name
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    String? city = placemarks[0].locality;
    return city ?? "";
  }
}
