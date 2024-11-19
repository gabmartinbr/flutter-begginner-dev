import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  const String apiKey = 'your_api_key'; // Reemplaza con tu API Key
  const String cityName = 'London';
  const String baseUrl = 'http://api.openweathermap.org/data/2.5/weather';

  try {
    final response = await http.get(
      Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Weather data: $data');
    } else {
      print('Failed to fetch weather data. Status: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
