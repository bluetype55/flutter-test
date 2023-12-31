import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Model {
  Widget getWeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset('svg/climacon-could_lightning.svg');
    } else if (condition < 600) {
      return SvgPicture.asset('svg/climacon-could_snow_alt.svg');
    } else if (condition == 800) {
      return SvgPicture.asset('svg/climacon-sun.svg');
    } else {
      return SvgPicture.asset(
        'svg/climacon-cloud_sun.svg',
        colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
      );
    }
  }

  Widget getAirIcon(int index) {
    if (index == 1) {
      return Image.asset(
        'image/good.svg',
        width: 37,
        height: 35,
      );
    } else if (index == 2) {
      return Image.asset(
        'image/fair.png',
        width: 37,
        height: 35,
      );
    } else if (index == 3) {
      return Image.asset(
        'image/moderate.png',
        width: 37,
        height: 35,
      );
    } else if (index == 4) {
      return Image.asset(
        'image/poor.png',
        width: 37,
        height: 35,
      );
    } else {
      return Image.asset(
        'image/bad.png',
        width: 37,
        height: 35,
      );
    }
  }

  Widget getAirCondition(int index) {
    if (index == 1) {
      return const Text('"매우좋음"',
          style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold));
    } else if (index == 2) {
      return const Text('"좋음"',
          style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold));
    } else if (index == 3) {
      return const Text('"보통"',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold));
    } else if (index == 4) {
      return const Text('"나쁨"',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold));
    } else {
      return const Text('"매우나쁨"',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold));
    }
  }
}
