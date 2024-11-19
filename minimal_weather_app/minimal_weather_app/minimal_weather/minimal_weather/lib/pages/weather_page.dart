import 'package:flutter/material.dart';
import 'package:minimal_weather/services/weather_service.dart';
import 'package:minimal_weather/models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  // api key
  final _weatherService = WeatherService('02237478572c9a3c19d39380e959bf7d');

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
    }

    catch (e) {
      print(e);
    }
  }
  // weather animations

  // init state
  @override
  void initState() {
    super.initState();

    // fetch weather
    _fetchWeather();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // city name
            Text(_weather?.cityName ?? "loading city..."),
        
            // temperature
            Text('${_weather?.temperature.round()}ºC')
          ],
        ),
      )
    );
  }
}