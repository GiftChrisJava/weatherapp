import 'package:flutter/material.dart';
import 'package:register/models/forecast_model.dart';
import 'package:register/services/forecast_service.dart';

class WeatherForecastPage extends StatefulWidget {
  const WeatherForecastPage({super.key});

  @override
  State<WeatherForecastPage> createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  late Future<List<WeatherDataPoint>> forecast;

  @override
  void initState() {
    super.initState();
    // Initialize the ForecastService with your API key
    ForecastService forecastService =
        ForecastService('c61d1bf8f97db4398fc103b6e040e97a');
    forecast = forecastService.getForecastByLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
      body: FutureBuilder<List<WeatherDataPoint>>(
        future: forecast,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                WeatherDataPoint dataPoint = snapshot.data![index];
                return ListTile(
                  title:
                      Text('${dataPoint.dateTime}: ${dataPoint.mainCondition}'),
                  subtitle: Text(
                      'Temp: ${dataPoint.temperature}°C, Wind: ${dataPoint.windSpeed} m/s, Humidity: ${dataPoint.humidity}%'),
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
