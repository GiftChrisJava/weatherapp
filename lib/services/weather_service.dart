import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:register/models/weather_model.dart';

import 'dart:convert';

class WeatherService {
  static const BASEURL = "https://api.openweathermap.org/data/2.5/weather";
  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather> getWeather(String cityName) async {
    final response = await http
        .get(Uri.parse("$BASEURL?q=$cityName&appid=$apiKey&units=metric"));

    switch (response.statusCode) {
      case 200:
        return Weather.fromJson(jsonDecode(response.body));
      case 401:
        throw Exception("Unauthorized - Check your API key");
      case 404:
        throw Exception("City not found");
      default:
        throw Exception(
            "Failed to load weather with status code: ${response.statusCode}");
    }
  }

  Future<String> getCurrentCity() async {
    // get permisssion from user
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // fetch current position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // convert location into lists of placemark objects
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    // extract the exact city from a list of placemarks
    String? city = placemarks[0].locality;

    return city ?? "";
  }
}
