import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    getLocation();
    fetchData();
  }

  void getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
    } catch (e) {
      print(e);
    }
  }

  void fetchData() async {
    String url = 'https://samples.openweathermap.org/data/2.5/weather?'
        'q=London&appid=b1b15e88fa797225412429c1c50c122a1';
    final http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String json = response.body;
      var myJson = jsonDecode(json)['weather'][0]['description'];
      var windSpeed = jsonDecode(json)['wind']['speed'];
      var id = jsonDecode(json)['id'];
      print(myJson);
      print(windSpeed);
      print(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: null, child: Text('get my location')),
      ),
    );
  }
}
