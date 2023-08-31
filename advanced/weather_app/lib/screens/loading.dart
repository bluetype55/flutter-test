import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/data/my_location.dart';
import 'package:weather_app/data/network.dart';
import 'package:weather_app/screens/weather_screen.dart';

const String apikey = 'c7e5627b0f1414c87b6d4bda3fbf649e';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late final double latitude3;
  late final double longtitude3;

  @override
  void initState() {
    super.initState();
    getLocation();
    // fetchData();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longtitude3 = myLocation.longtitude2;
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longtitude3&appid=$apikey&units=metric';
    String url2 =
        'https://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude3&lon=$longtitude3&appid=$apikey';
    Network network = Network(url, url2);

    print(url);
    print(url2);

    var weatherData = await network.getJsonData();
    var airData = await network.getAirData();
    if (!mounted) return;
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
        parseWeatherData: weatherData,
        parseAirPollution: airData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.black87, size: 80),
      ),
    );
  }
}

// void fetchData() async {
//   String url = 'https://samples.openweathermap.org/data/2.5/weather?'
//       'q=London&appid=b1b15e88fa797225412429c1c50c122a1';
//   final http.Response response = await http.get(Uri.parse(url));
//   if (response.statusCode == 200) {
//     String jsonData = response.body;
//     var parsingData = jsonDecode(jsonData);
//     var myJson = parsingData['weather'][0]['description'];
//     var windSpeed = parsingData['wind']['speed'];
//     var id = parsingData['id'];
//     print(myJson);
//     print(windSpeed);
//     print(id);
//   }
// }
