import 'dart:convert';
import 'package:weather_app/api/weather_model.dart';
import 'package:http/http.dart' as http;

Future<Weather> fetchWeather(String city) async {
  const apiKey = 'fd24dc06857899844fabff8b14d6fff2';
  final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric'));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return Weather.fromJson(jsonData);
  } else {
    throw Exception('Failed to fetch weather');
  }
}
