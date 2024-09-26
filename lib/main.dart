import 'package:flutter/material.dart';

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
    // Simulate fetching weather data (to be implemented later)
    setState(() {
      _cityName = _controller.text;
      _temperature = '${(15 + (30 - 15) * (0.5)).toStringAsFixed(1)} °C'; // Example temp
      _weatherCondition = 'Sunny'; // Example condition
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
            Text(
              'City: $_cityName',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Temperature: $_temperature',
              style: TextStyle(fontSize: 20),
            ),
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
