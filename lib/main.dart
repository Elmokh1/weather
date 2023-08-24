import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_model.dart';

import 'api/api_manger.dart';


void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final _cityController = TextEditingController();
  Weather? _currentWeather;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'Enter City'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_cityController.text.isNotEmpty) {
                    final weather = await fetchWeather(_cityController.text);
                    setState(() {
                      _currentWeather = weather;
                    });
                  }
                },
                child: const Text('Get Weather'),
              ),
              const SizedBox(height: 32),
              if (_currentWeather != null)
                Column(
                  children: [
                    Text(
                      _currentWeather!.cityName,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${_currentWeather!.temperature.toStringAsFixed(1)}°C',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      _currentWeather!.description,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}


