import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart'; // Import for date formatting

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
  List<Map<String, String>> _forecast = [];

  void _fetchWeather() {
    setState(() {
      _cityName = _controller.text;

      // Generate a random temperature between 15 and 30
      int minTemp = 15;
      int maxTemp = 30;
      int randomTemp = Random().nextInt(maxTemp - minTemp + 1) + minTemp;

      // Randomly select a weather condition
      List<String> conditions = ['Sunny', 'Cloudy', 'Rainy', 'Stormy', 'Snowy'];
      String randomCondition = conditions[Random().nextInt(conditions.length)];

      _temperature = '$randomTemp °C';
      _weatherCondition = randomCondition;
    });
  }

  void _fetch7DayForecast() {
    setState(() {
      _forecast = List.generate(7, (index) {
        int randomTemp = Random().nextInt(16) + 15; // Temp between 15-30
        List<String> conditions = ['Sunny', 'Cloudy', 'Rainy', 'Stormy', 'Snowy'];
        String randomCondition = conditions[Random().nextInt(conditions.length)];

        // Format the date
        DateTime forecastDate = DateTime.now().add(Duration(days: index));
        String formattedDate = DateFormat('EEEE, MMM d').format(forecastDate);

        return {
          'day': formattedDate,  // Use the formatted date
          'temperature': '$randomTemp °C',
          'condition': randomCondition,
        };
      });
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
            ElevatedButton(
              onPressed: _fetch7DayForecast,
              child: Text('Fetch 7-Day Forecast'),
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
            SizedBox(height: 20),
            // Display the 7-day forecast
            Text(
              '7-Day Forecast:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _forecast.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_forecast[index]['day']!),
                      subtitle: Text(
                        'Temperature: ${_forecast[index]['temperature']}\n'
                        'Condition: ${_forecast[index]['condition']}',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// For example, change a comment in the code:
// This is the weather app code.  