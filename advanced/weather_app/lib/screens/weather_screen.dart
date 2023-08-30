import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class WeatherScreen extends StatefulWidget {
  final dynamic parseWeatherData;
  const WeatherScreen({this.parseWeatherData, super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late String cityName;
  late int temp2;
  var date = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    double temp = weatherData['main']['temp'];
    temp2 = temp.round();
    cityName = weatherData['name'];

    print(temp);
    print(cityName);
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat('h:mm a').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.near_me),
          iconSize: 30,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.location_searching),
            iconSize: 30,
          )
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            'image/background.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 150),
                            Text(
                              'seoul',
                              style: GoogleFonts.lato(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                TimerBuilder.periodic(
                                  const Duration(minutes: 1),
                                  builder: (context) {
                                    print(getSystemTime());
                                    return Text(
                                      getSystemTime(),
                                      style: GoogleFonts.lato(
                                          fontSize: 16, color: Colors.white),
                                    );
                                  },
                                ),
                                Text(
                                  DateFormat(' - EEEE, ').format(date),
                                  style: GoogleFonts.lato(
                                      fontSize: 16, color: Colors.white),
                                ),
                                Text(
                                  DateFormat('d MMM yyy').format(date),
                                  style: GoogleFonts.lato(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '18\u2103',
                        style: GoogleFonts.lato(
                          fontSize: 85,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('svg/climacon-sun.svg'),
                          SizedBox(width: 10),
                          Text(
                            'clear sky',
                            style: GoogleFonts.lato(
                                fontSize: 16, color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Divider(
                        height: 15,
                        thickness: 2,
                        color: Colors.white30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'AQI(대기질지수)',
                                style: GoogleFonts.lato(
                                    fontSize: 14, color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              Image.asset(
                                'image/bad.png',
                                width: 37,
                                height: 35,
                              ),
                              SizedBox(height: 10),
                              Text(
                                '"매우나쁨"',
                                style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '미세먼지',
                                style: GoogleFonts.lato(
                                    fontSize: 14, color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '174.75',
                                style: GoogleFonts.lato(
                                    fontSize: 24, color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'μg/m3',
                                style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '초미세먼지',
                                style: GoogleFonts.lato(
                                    fontSize: 14, color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '84.03',
                                style: GoogleFonts.lato(
                                    fontSize: 24, color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'μg/m3',
                                style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}