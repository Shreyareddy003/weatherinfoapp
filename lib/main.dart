import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(WeatherInfoApp());
}

class WeatherInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _cityName = '';
  String _temperature = '';
  String _weatherCondition = '';

  void _fetchWeather() {
    // Simulate fetching weather data
    setState(() {
      _cityName = _controller.text;

      // Generate a random temperature between 15 and 30
      int minTemp = 15;
      int maxTemp = 30;
      int randomTemp = Random().nextInt(maxTemp - minTemp + 1) + minTemp;

      // Randomly select a weather condition
      List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
      String randomCondition = conditions[Random().nextInt(conditions.length)];

      _temperature = '$randomTemp °C';
      _weatherCondition = randomCondition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 20),
            // Display the entered city name
            Text(
              'City: $_cityName',
              style: TextStyle(fontSize: 20),
            ),
            // Display the generated temperature
            Text(
              'Temperature: $_temperature',
              style: TextStyle(fontSize: 20),
            ),
            // Display the weather condition
            Text(
              'Condition: $_weatherCondition',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
