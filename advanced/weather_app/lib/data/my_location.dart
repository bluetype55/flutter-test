import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class MyLocation{
  late double latitude2;
  late double longtitude2;

  Future<void> getMyCurrentLocation() async{
    try{
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude2 = position.latitude;
    longtitude2 = position.longitude;
  } catch (e) {
      debugPrint('$e');
  }
  }
}