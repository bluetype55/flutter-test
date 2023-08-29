import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {

  final dynamic parseWeatherData;
  const WeatherScreen({this.parseWeatherData, super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late String cityName;
  late int temp2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData){
    double temp = weatherData['main']['temp'];
    temp2 = temp.round();
    cityName = weatherData['name'];

    print(temp);
    print(cityName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cityName,
                style: const TextStyle(fontSize: 30),
              ),
              SizedBox(height: 20),
              Text(
                '$temp2',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
